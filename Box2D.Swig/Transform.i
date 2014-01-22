%ignore b2Transform::Set;
%ignore b2Transform::SetIdentity;

%rename(Transform) b2Transform;
%rename(Position) b2Transform::p;
%rename(Rotation) b2Transform::q;