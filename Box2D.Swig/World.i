%ignore b2World::GetContactManager;
%ignore b2World::GetProfile;
%ignore b2World::Dump;

%rename(World) b2World;
%typemap(csclassmodifiers) b2World "public partial class"

%rename(NativeCreateBody) b2World::CreateBody;
%csmethodmodifiers b2World::CreateBody "private";
%typemap(cstype) b2Body* CreateBody %{ IntPtr %}
%typemap(csout, excode=SWIGEXCODE) b2Body* CreateBody {
    IntPtr cPtr = $imcall;$excode
    return cPtr;
}

%typemap(csbody) b2World %{
  private HandleRef swigCPtr;
  protected bool swigCMemOwn;

  internal ObjectPool<Body> _freeBodies;
  internal ObjectPool<Fixture> _freeFixtures;
  internal Dictionary<IntPtr, Body> _bodies;
  internal Dictionary<IntPtr, Fixture> _fixtures;
  internal Dictionary<IntPtr, Joint> _joints;

  internal IntPtr Handle { get { return swigCPtr.Handle; } }

  internal $csclassname(IntPtr cPtr, bool cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = new HandleRef(this, cPtr);

    _freeBodies = new ObjectPool<Body>(() => new Body(this));
  	_freeFixtures = new ObjectPool<Fixture>(() => new Fixture(IntPtr.Zero, true));
  	_bodies = new Dictionary<IntPtr, Body>();
  	_fixtures = new Dictionary<IntPtr, Fixture>();
  	_joints = new Dictionary<IntPtr, Joint>();

    ContactListener = new CustomContactListener(this);
  }

  internal static HandleRef getCPtr($csclassname obj) {
    return (obj == null) ? new HandleRef(null, IntPtr.Zero) : obj.swigCPtr;
  }
%}

%rename(NativeDestroyBody) b2World::DestroyBody;
%csmethodmodifiers b2World::DestroyBody "private";
%csmethodmodifiers b2World::SetContactListener "private";

%attribute(b2World, bool, AllowSleeping, GetAllowSleeping, SetAllowSleeping);
%attribute(b2World, bool, WarmStarting, GetWarmStarting, SetWarmStarting);
%attribute(b2World, bool, ContinuousPhysics, GetContinuousPhysics, SetContinuousPhysics);
%attribute(b2World, bool, SubStepping, GetSubStepping, SetSubStepping);
%attribute(b2World, int, ProxyCount, GetProxyCount);
%attribute(b2World, int, BodyCount, GetBodyCount);
%attribute(b2World, int, JointCount, GetJointCount);
%attribute(b2World, int, ContactCount, GetContactCount);
%attribute(b2World, int, TreeHeight, GetTreeHeight);
%attribute(b2World, int, TreeBalance, GetTreeBalance);
%attribute(b2World, float, TreeQuality, GetTreeQuality);
%attribute(b2World, b2Vec2, Gravity, GetGravity, SetGravity);
%attribute(b2World, bool, IsLocked, IsLocked);
%attribute(b2World, bool, AutoClearForces, GetAutoClearForces, SetAutoClearForces);