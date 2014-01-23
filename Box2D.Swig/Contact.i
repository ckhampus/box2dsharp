%rename(Contact) b2Contact;

%attribute(b2Contact, b2Manifold, Manifold, GetManifold);
%attribute(b2Contact, b2Contact, Next, GetNext);
%attribute(b2Contact, b2Fixture, FixtureA, GetFixtureA);
%attribute(b2Contact, b2Fixture, FixtureB, GetFixtureB);
%attribute(b2Contact, bool, IsTouching, IsTouching);
%attribute(b2Contact, bool, IsEnabled, IsEnabled, SetEnabled);
%attribute(b2Contact, int, ChildIndexA, GetChildIndexA);
%attribute(b2Contact, int, ChildIndexB, GetChildIndexB);
%attribute(b2Contact, float, Friction, GetFriction, SetFriction);
%attribute(b2Contact, float, Restitution, GetRestitution, SetRestitution);

%typemap(cscode) b2Contact %{
  internal void Reset(IntPtr cPtr)
  {
    swigCPtr = new HandleRef(this, cPtr);
  }
%}
