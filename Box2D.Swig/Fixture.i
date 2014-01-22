%ignore b2Fixture::GetAABB;
%ignore b2Fixture::Dump;
%ignore b2Fixture::RayCast;
%ignore b2Fixture::GetBody;

%rename(Fixture) b2Fixture;
%typemap(csclassmodifiers) b2Fixture "public partial class"

%rename(NativeGetShape) b2Fixture::GetShape;
%csmethodmodifiers b2Fixture::GetShape "private";
%typemap(cstype) b2Shape* GetShape %{ IntPtr %}
%typemap(csout, excode=SWIGEXCODE) b2Shape* GetShape {
    IntPtr cPtr = $imcall;$excode
    return cPtr;
}

%attributeval(b2Fixture, b2Filter, FilterData, GetFilterData, SetFilterData);
// %attribute(b2Fixture, b2Body, Body, GetBody);
%attribute(b2Fixture, b2Fixture, Next, GetNext);
%attribute(b2Fixture, void*, UserData, GetUserData, SetUserData);
%attribute(b2Fixture, b2Shape::Type, Type, GetType);
// %attribute(b2Fixture, b2Shape, NativeShape, GetShape);
%attribute(b2Fixture, float, Restitution, GetRestitution, SetRestitution);
%attribute(b2Fixture, float, Friction, GetFriction, SetFriction);
%attribute(b2Fixture, float, Density, GetDensity, SetDensity);
%attribute(b2Fixture, bool, IsSensor, IsSensor, SetSensor);
