%ignore b2Body::GetFixtureList;
%ignore b2Body::GetWorld;
%ignore b2Body::GetJointList;
%ignore b2Body::GetContactList;
%ignore b2Body::Dump;

%rename(Body) b2Body;
%typemap(csclassmodifiers) b2Body "public partial class"

%typemap(csout, excode=SWIGEXCODE) b2Fixture* CreateFixture {
    IntPtr fixturePtr = $imcall;$excode
    Fixture fixture = World._freeFixtures.GetObject();
    fixture.Reset(this, fixturePtr);
    World._fixtures.Add(fixturePtr, fixture);
    Fixtures.Add(fixture);
    return fixture;
  }

%typemap(csout, excode=SWIGEXCODE) void DestroyFixture {
    $imcall;$excode
    World._fixtures.Remove(fixture.Handle);
    Fixtures.Remove(fixture);
    World._freeFixtures.PutObject(fixture);
  }

%typemap(cstype, out="BodyType") b2BodyType "BodyType"
%typemap(csout, excode=SWIGEXCODE) b2BodyType %{
  return (BodyType)$imcall;$excode
%}
%typemap(csvarout, excode=SWIGEXCODE2) b2BodyType %{
  get {
    return (BodyType)$imcall;$excode
  }
%}

%attributeref(b2Body, b2Transform, Transform, GetTransform);
%attributeref(b2Body, b2Vec2, Position, GetPosition);
%attributeref(b2Body, b2Vec2, WorldCenter, GetWorldCenter);
%attributeref(b2Body, b2Vec2, LocalCenter, GetLocalCenter);
%attributeval(b2Body, b2Vec2, LinearVelocity, GetLinearVelocity, SetLinearVelocity);
%attribute(b2Body, b2Body, Next, GetNext);
%attribute(b2Body, b2BodyType, Type, GetType, SetType);
%attribute(b2Body, void*, UserData, GetUserData, SetUserData);
%attribute(b2Body, float, Angle, GetAngle);
%attribute(b2Body, float, Mass, GetMass);
%attribute(b2Body, float, Inertia, GetInertia);
%attribute(b2Body, float, LinearDamping, GetLinearDamping, SetLinearDamping);
%attribute(b2Body, float, AngularDamping, GetAngularDamping, SetAngularDamping);
%attribute(b2Body, float, AngularVelocity, GetAngularVelocity, SetAngularVelocity);
%attribute(b2Body, float, GravityScale, GetGravityScale, SetGravityScale);
%attribute(b2Body, bool, IsBullet, IsBullet, SetBullet);
%attribute(b2Body, bool, IsSleepingAllowed, IsSleepingAllowed, SetSleepingAllowed);
%attribute(b2Body, bool, IsAwake, IsAwake, SetAwake);
%attribute(b2Body, bool, IsActive, IsActive, SetActive);
%attribute(b2Body, bool, IsFixedRotation, IsFixedRotation, SetFixedRotation);

%typemap(cscode) b2Body %{
  public World World { get; private set; }

  public List<Fixture> Fixtures { get; set; }

  public List<JointEdge> Joints { get; set; }

  internal Body(World world) : this(IntPtr.Zero, false)
  {
      World = world;
  }

  internal void Reset(IntPtr cPtr)
  {
    swigCPtr = new HandleRef(this, cPtr);
    UserData = IntPtr.Zero;
    foreach (var fixture in Fixtures)
    {
      World._freeFixtures.PutObject(fixture);
    }
    Fixtures.Clear();
    Joints.Clear();
  }
%}
