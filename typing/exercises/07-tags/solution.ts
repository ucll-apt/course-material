interface Circle
{
    tag: 'circle';

    radius: number;
}

interface Square
{
    tag: 'square';

    side: number;
}

type Shape = Circle | Square;

export function area(shape : Shape) : number
{
    switch ( shape.tag )
    {
    case 'circle':
        return shape.radius ** 2 * Math.PI;

    case 'square':
        return shape.side ** 2;
    }
}
