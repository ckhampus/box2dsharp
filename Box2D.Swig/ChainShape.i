// %ignore b2ChainShape::SetPrevVertex;
// %ignore b2ChainShape::SetNextVertex;

%rename(ChainShape) b2ChainShape;
%rename(Count) b2ChainShape::m_count;
%rename(PrevVertex) b2ChainShape::m_prevVertex;
%rename(NextVertex) b2ChainShape::m_nextVertex;
%rename(HasPrevVertex) b2ChainShape::m_hasPrevVertex;
%rename(HasNextVertex) b2ChainShape::m_hasNextVertex;
%rename(NativeCreateLoop) b2ChainShape::CreateLoop;
%rename(NativeCreateChain) b2ChainShape::CreateChain;

%apply float INPUT[] {float vertices[]};

%typemap(csclassmodifiers) b2ChainShape "public partial class"

%csmethodmodifiers b2ChainShape::CreateLoop "private";
%csmethodmodifiers b2ChainShape::CreateChain "private";

%extend b2ChainShape {
    void CreateLoop(float vertices[], int numVertices) {
        b2Vec2* verticesOut = new b2Vec2[numVertices];
        for( int i = 0; i < numVertices; i++ )
            verticesOut[i] = b2Vec2(vertices[i<<1], vertices[(i<<1)+1]);
        $self->CreateLoop(verticesOut, numVertices);
        delete verticesOut;
    }

    void CreateChain(float vertices[], int numVertices) {
        b2Vec2* verticesOut = new b2Vec2[numVertices];
        for( int i = 0; i < numVertices; i++ )
            verticesOut[i] = b2Vec2(vertices[i<<1], vertices[(i<<1)+1]);
        $self->CreateChain(verticesOut, numVertices);
        delete verticesOut;
    }
}

%ignore b2ChainShape::CreateLoop;
%ignore b2ChainShape::CreateChain;
%ignore b2ChainShape::m_vertices;

// %typemap(cscode) b2ChainShape %{
//     public void CreateChain(Microsoft.Xna.Framework.Vector2[] vertices) {
//         var array = Box2D.new_b2Vec2Array(vertices.Length);
//         for (int i = 0; i < vertices.Length; i++) {
//             Box2D.b2Vec2Array_setitem(array, i, new Vec2(vertices[i].X, vertices[i].Y));
//         }
//         CreateChain(array, vertices.Length);
//     }

//     public void CreateLoop(Microsoft.Xna.Framework.Vector2[] vertices) {
//         var array = Box2D.new_b2Vec2Array(vertices.Length);
//         for (int i = 0; i < vertices.Length; i++) {
//             Box2D.b2Vec2Array_setitem(array, i, new Vec2(vertices[i].X, vertices[i].Y));
//         }
//         CreateLoop(array, vertices.Length);
//     }

//     public Microsoft.Xna.Framework.Vector2[] Vertices {
//         get {
//             var array = new Microsoft.Xna.Framework.Vector2[Count];

//             for (int i = 0; i < array.Length; i++) {
//                 var vertex = Box2D.b2Vec2Array_getitem (m_vertices, i);
//                 array[i] = new Microsoft.Xna.Framework.Vector2(vertex.x, vertex.y);
//             }

//             return array;
//         }
//         set {
//             var array = Box2D.new_b2Vec2Array(value.Length);
//             for (int i = 0; i < value.Length; i++) {
//                 Box2D.b2Vec2Array_setitem(array, i, new Vec2(value[i].X, value[i].Y));
//             }

//             m_vertices = array;
//         }
//     }
// %}