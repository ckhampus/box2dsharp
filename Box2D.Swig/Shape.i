

%ignore b2Shape::Type;
%ignore b2Shape::GetType;
%ignore b2Shape::RayCast;
%ignore b2Shape::ComputeAABB;
%ignore b2Shape::ComputeMass;
%ignore b2Shape::Clone;
%ignore b2Shape::TestPoint;

%typemap(cstype, out="ShapeType") b2Shape::Type "ShapeType"
%typemap(csout, excode=SWIGEXCODE) b2Shape::Type %{
  return (ShapeType)$imcall;$excode
%}
%typemap(csvarout, excode=SWIGEXCODE2) b2Shape::Type %{
    get {
      return (ShapeType)$imcall;$excode
    }
%}

%rename(Shape) b2Shape;
%rename(Type) b2Shape::m_type;
%rename(Radius) b2Shape::m_radius;

%typemap(csclassmodifiers) b2Shape "public partial class"




%attribute(b2Shape, int, ChildCount, GetChildCount);