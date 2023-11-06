using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using System.Linq;
using System;

namespace syncdemo
{
    class Program
    {
        public static void RunWithoutSynchronization( int nThreads, int bufferSize )
        {
            int[] buffer = new int[bufferSize];
            var stopwatch = new Stopwatch();

            stopwatch.Start();
            var threads = new List<Thread>();
            for ( var i = 0; i != nThreads; ++i )
            {
                var thread = new Thread( () =>
                {
                    for ( var j = 0; j != buffer.Length; ++j )
                    {
                        buffer[j]++;
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

            var errorCount = 0;
            for ( var i = 0; i != buffer.Length; ++i )
            {
                if ( buffer[i] != nThreads )
                {
                    errorCount++;
                }
            }
            var percentage = 100.0 * errorCount / bufferSize;
            var totalOperations = bufferSize * nThreads;
            Console.WriteLine( $"Thread count {nThreads}: {errorCount} errors found ({percentage}%), {totalOperations / (1000000.0 * stopwatch.Elapsed.TotalSeconds)}Mops/m, {stopwatch.Elapsed.TotalMilliseconds}ms" );
        }

        public static void RunWithSingleLock( int nThreads, int bufferSize )
        {
            int[] buffer = new int[bufferSize];
            var stopwatch = new Stopwatch();

            stopwatch.Start();
            var threads = new List<Thread>();
            for ( var j = 0; j != nThreads; ++j )
            {
                var thread = new Thread( () =>
                {
                    lock ( buffer )
                    {
                        for ( var i = 0; i != buffer.Length; ++i )
                        {
                            buffer[i]++;
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

            var errorCount = 0;
            for ( var i = 0; i != buffer.Length; ++i )
            {
                if ( buffer[i] != nThreads )
                {
                    errorCount++;
                }
            }
            var percentage = 100.0 * errorCount / bufferSize;
            var totalOperations = bufferSize * nThreads;
            Console.WriteLine( $"Thread count {nThreads}: {errorCount} errors found ({percentage}%), {totalOperations / (1000000.0 * stopwatch.Elapsed.TotalSeconds)}Mops/m, {stopwatch.Elapsed.TotalMilliseconds}ms" );
        }

        public static void RunWithLockPerOp( int nThreads, int bufferSize )
        {
            int[] buffer = new int[bufferSize];
            var stopwatch = new Stopwatch();

            stopwatch.Start();
            var threads = new List<Thread>();
            for ( var j = 0; j != nThreads; ++j )
            {
                var thread = new Thread( () =>
                {
                    for ( var i = 0; i != buffer.Length; ++i )
                    {
                        lock ( buffer )
                        {
                            buffer[i]++;
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

            var errorCount = 0;
            for ( var i = 0; i != buffer.Length; ++i )
            {
                if ( buffer[i] != nThreads )
                {
                    errorCount++;
                }
            }
            var percentage = 100.0 * errorCount / bufferSize;
            var totalOperations = bufferSize * nThreads;
            Console.WriteLine( $"Thread count {nThreads}: {errorCount} errors found ({percentage}%), {totalOperations / (1_000_000.0 * stopwatch.Elapsed.TotalSeconds)}Mops/m, {stopwatch.Elapsed.TotalMilliseconds}ms" );
        }

        public static void RunUsingLockedBlocks( int nThreads, int bufferSize, int nBlocks )
        {
            int[] buffer = new int[bufferSize];
            List<object> locks = Enumerable.Range( 0, nBlocks ).Select( _ => new object() ).ToList();
            var stopwatch = new Stopwatch();

            stopwatch.Start();
            var threads = new List<Thread>();
            for ( var j = 0; j != nThreads; ++j )
            {
                var thread = new Thread( () =>
                {
                    for ( var i = 0; i != buffer.Length; ++i )
                    {
                        lock ( locks[i % nBlocks] )
                        {
                            buffer[i]++;
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

            var errorCount = 0;
            for ( var i = 0; i != buffer.Length; ++i )
            {
                if ( buffer[i] != nThreads )
                {
                    errorCount++;
                }
            }
            var percentage = 100.0 * errorCount / bufferSize;
            var totalOperations = bufferSize * nThreads;
            Console.WriteLine( $"Thread count {nThreads}: {errorCount} errors found ({percentage}%), {totalOperations / (1_000_000.0 * stopwatch.Elapsed.TotalSeconds)}Mops/m, {stopwatch.Elapsed.TotalMilliseconds}ms" );
        }

        public static void Main( string[] args )
        {
            for ( var i = 1; i <= 10; ++i )
            {
                RunUsingLockedBlocks( i, 100_000_000, 100 );
            }
        }
    }
}
