%ignore b2CircleShape::GetVertex;

%rename(CircleShape) b2CircleShape;
%rename(Position) b2CircleShape::m_p;

%attribute(b2CircleShape, int, VertexCount, GetVertexCount);