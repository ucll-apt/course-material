using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading;

namespace bankdemo
{
    class Program
    {
        static void Main( string[] args )
        {
            var nBankAccounts = 10_000;
            var nTransactions = 50_000_000;
            var accounts = CreateBankAccounts( nBankAccounts );
            var transactions = CreateTransactions( accounts, nTransactions );

            SingleThreaded( transactions );

            //for ( var i = 1; i <= 10; ++i )
            //{
            //    DistributeTransactionsSmartLocking( transactions, i );
            //}

            for ( var i = 1; i <= 4; ++i )
            {
                GroupByBankAccounts( transactions, i );
            }
        }

        public static void SingleThreaded( List<Transaction> transactions )
        {
            var stopwatch = new Stopwatch();
            stopwatch.Start();

            var threads = new List<Thread>();

            for ( var i = 0; i != transactions.Count; ++i )
            {
                var transaction = transactions[i];
                transaction.From.Balance -= transaction.Amount;
                transaction.To.Balance += transaction.Amount;
            }

            stopwatch.Stop();
            Console.WriteLine( $"Took {stopwatch.ElapsedMilliseconds}ms single threaded" );
        }

        public static void DistributeTransactionsNaiveLocking( List<Transaction> transactions, int nThreads )
        {
            var stopwatch = new Stopwatch();
            stopwatch.Start();

            var transactionsPerThread = transactions.Count / nThreads;
            var threads = new List<Thread>();

            for ( var i = 0; i != nThreads; ++i )
            {
                var startIndex = transactionsPerThread * i;
                var endIndex = Math.Min( transactions.Count, startIndex + transactionsPerThread );

                var thread = new Thread( () =>
                {
                    for ( var j = startIndex; j != endIndex; ++j )
                    {
                        var transaction = transactions[j];
                        lock ( transaction.From )
                        {
                            lock ( transaction.To )
                            {
                                transaction.From.Balance -= transaction.Amount;
                                transaction.To.Balance += transaction.Amount;
                            }
                        }
                    }
                } );

                thread.Start();
                threads.Add( thread );
            }

            foreach ( var thread in threads )
            {
                thread.Join();
            }

            stopwatch.Stop();
            Console.WriteLine( $"Took {stopwatch.ElapsedMilliseconds}ms using {nThreads} threads" );
        }

        public static void DistributeTransactionsSmartLocking( List<Transaction> transactions, int nThreads )
        {
            var stopwatch = new Stopwatch();
            stopwatch.Start();

            var transactionsPerThread = transactions.Count / nThreads;
            var threads = new List<Thread>();

            for ( var j = 0; j != nThreads; ++j )
            {
                var startIndex = transactionsPerThread * j;
                var endIndex = Math.Min( transactions.Count, startIndex + transactionsPerThread );

                var thread = new Thread( () =>
                {
                    for ( var i = startIndex; i != endIndex; ++i )
                    {
                        var transaction = transactions[i];
                        var accounts = new List<BankAccount>() { transaction.From, transaction.To }.OrderBy( x => x.Id ).ToList();

                        lock ( accounts[0] )
                        {
                            lock ( accounts[1] )
                            {
                                transaction.From.Balance -= transaction.Amount;
                                transaction.To.Balance += transaction.Amount;
                            }
                        }
                    }
                } );

                thread.Start();
                threads.Add( thread );
            }

            foreach ( var thread in threads )
            {
                thread.Join();
            }

            stopwatch.Stop();
            Console.WriteLine( $"Took {stopwatch.ElapsedMilliseconds}ms using {nThreads} threads" );
        }

        public static void GroupByBankAccounts( List<Transaction> transactions, int nGroups )
        {
            var stopwatch = new Stopwatch();
            stopwatch.Start();

            var locks = Enumerable.Range( 0, nGroups ).Select( _ => new object() ).ToList();
            var queues = Enumerable.Range( 0, nGroups * (nGroups + 1) / 2).Select( _ => new List<Transaction>() ).ToList();

            foreach ( var transaction in transactions )
            {
                var i = transaction.From.Id % nGroups;
                var j = transaction.To.Id % nGroups;

                if ( j > i )
                {
                    var t = i;
                    i = j;
                    j = i;
                }

                var k = i * nGroups + j;

                queues[k].Add( transaction );
            }

            var threads = new List<Thread>();

            for ( var i = 0; i != nGroups; ++i )
            {
                for ( var j = i; j != nGroups; ++j )
                {
                    var ci = i;
                    var cj = j;
                    var k = ci * nGroups + cj;

                    var thread = new Thread( () =>
                     {
                         lock ( locks[ci] )
                         {
                             lock ( locks[cj] )
                             {
                                 Console.WriteLine( $"{ci}/{cj}" );
                                 foreach ( var transaction in queues[k] )
                                 {
                                     var mi = transaction.From.Id % nGroups;
                                     var mj = transaction.To.Id % nGroups;

                                     if ( (ci == mi && cj == mj) || (ci == mj && cj == mi) )
                                     {
                                         transaction.Perform();
                                     }
                                 }
                             }
                         }
                     } );

                    thread.Start();
                    threads.Add( thread );
                }
            }

            foreach ( var thread in threads )
            {
                thread.Join();
            }

            stopwatch.Stop();
            Console.WriteLine( $"Took {stopwatch.ElapsedMilliseconds}ms using {nGroups} groups" );
        }

        public static List<BankAccount> CreateBankAccounts( int nBankAccounts )
        {
            return Enumerable.Range( 1, nBankAccounts ).Select( i => new BankAccount() { Id = i } ).ToList();
        }

        public static List<Transaction> CreateTransactions( List<BankAccount> accounts, int nTransactions )
        {
            var rng = new Random();

            return Enumerable.Range( 1, nTransactions ).Select( _ =>
            {
                var fromIndex = rng.Next( accounts.Count );
                var toIndex = (fromIndex + rng.Next( accounts.Count - 1 )) % accounts.Count;
                var amount = rng.NextDouble() * 1000;

                return new Transaction
                {
                    From = accounts[fromIndex],
                    To = accounts[toIndex],
                    Amount = amount
                };
            } ).ToList();
        }
    }

    class BankAccount
    {
        public int Id { get; set; }
        public double Balance { get; set; }
    }

    class Transaction
    {
        public BankAccount From { get; set; }

        public BankAccount To { get; set; }

        public double Amount { get; set; }

        public void Perform()
        {
            From.Balance -= Amount;
            To.Balance += Amount;

            for ( int i = 0; i != 100; ++i ) ;
        }
    }
}
