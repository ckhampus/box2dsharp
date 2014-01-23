%ignore b2World::GetContactManager;
%ignore b2World::GetProfile;
%ignore b2World::Dump;
%ignore b2World::DrawDebugData;

%rename(World) b2World;
%typemap(csclassmodifiers) b2World "public partial class"

%typemap(csbody) b2World %{
  private HandleRef swigCPtr;
  protected bool swigCMemOwn;

  internal ObjectPool<Body> _freeBodies;
  internal ObjectPool<Fixture> _freeFixtures;
  internal Dictionary<IntPtr, Body> _bodies;
  internal Dictionary<IntPtr, Fixture> _fixtures;
  internal Dictionary<IntPtr, Joint> _joints;

  internal List<IntPtr> _contactPtrs;
  internal List<Contact> _contacts;
  internal List<Contact> _freeContacts;

  internal IntPtr Handle { get { return swigCPtr.Handle; } }

  internal $csclassname(IntPtr cPtr, bool cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = new HandleRef(this, cPtr);

    _freeBodies = new ObjectPool<Body>(() => new Body(this));
  	_freeFixtures = new ObjectPool<Fixture>(() => new Fixture(IntPtr.Zero, false));
  	_bodies = new Dictionary<IntPtr, Body>();
  	_fixtures = new Dictionary<IntPtr, Fixture>();
  	_joints = new Dictionary<IntPtr, Joint>();

    _contacts = new List<Contact>();

    ContactListener = new CustomContactListener(this);
  }

  internal static HandleRef getCPtr($csclassname obj) {
    return (obj == null) ? new HandleRef(null, IntPtr.Zero) : obj.swigCPtr;
  }

  public List<Body> Bodies { get { return _bodies.Values.ToList() } }

  public List<Joint> Joints { get { return _joints.Values.ToList() } }

  public List<Contact> Contacts {
    get
    {
      int numContacts = ContactCount;
      if (numContacts > _contacts.Capacity)
      {
        int newSize = 2 * numContacts;
        _contacts.Capacity = newSize;
      }

      IntPtr contactsArray = GetContactList();

      _contacts.Clear();

      for (int i = 0; i < numContacts; i++)
      {
        _contacts.Add(Box2D.ContactArray_getitem(contactsArray, i));
      }

      return _contacts;
    }
  }
%}

%typemap(csout, excode=SWIGEXCODE) b2Body* CreateBody {
    IntPtr bodyPtr = $imcall;$excode
    Body body = _freeBodies.GetObject();
    body.Reset(bodyPtr);
    _bodies.Add(bodyPtr, body);
    return body;
  }

%typemap(csout, excode=SWIGEXCODE) void DestroyBody {
    body.UserData = IntPtr.Zero;
    _bodies.Remove(body.Handle);

    foreach (var fixture in body.Fixtures)
    {
      fixture.UserData = IntPtr.Zero;
      _fixtures.Remove(fixture.Handle);
    }

    body.Fixtures.Clear();

    foreach (JointEdge joint in body.Joints)
    {
      DestroyJoint(joint.Joint);
    }

    body.Joints.Clear();

    $imcall;$excode
    _freeBodies.PutObject(body);
  }

%csmethodmodifiers b2World::SetContactListener "private";
%csmethodmodifiers b2World::GetContactList "private";

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
