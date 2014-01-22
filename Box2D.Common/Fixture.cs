using System;
using System.Runtime.InteropServices;

namespace Box2D
{
    public partial class Fixture
    {
        public Body Body { get; private set; }

        private Shape _shape;

        public Shape Shape
        {
            get
            {
                if (_shape == null)
                {
                    var shapePtr = NativeGetShape();
                    var type = (ShapeType)Box2DPINVOKE.Shape_Type_get(new HandleRef(null, shapePtr));

                    switch (type)
                    {
                        case ShapeType.Circle:
                            _shape = new CircleShape(shapePtr, true);
                            break;

                        case ShapeType.Edge:
                            _shape = new EdgeShape(shapePtr, true);
                            break;

                        case ShapeType.Polygon:
                            _shape = new PolygonShape(shapePtr, true);
                            break;

                        case ShapeType.Chain:
                            _shape = new ChainShape(shapePtr, true);
                            break;
                    }
                }

                return _shape;
            }
        }

        internal void Reset(Body body, IntPtr cPtr)
        {
            Body = body;
            swigCPtr = new HandleRef(this, cPtr);
            _shape = null;
            UserData = IntPtr.Zero;
        }
    }
}

