%ignore b2Body::ApplyForce;
%ignore b2Body::ApplyForceToCenter;
// %ignore b2Body::CreateFixture;
%ignore b2Body::GetFixtureList;
%ignore b2Body::GetWorld;
%ignore b2Body::GetJointList;
%ignore b2Body::GetContactList;
%ignore b2Body::Dump;

%rename(Body) b2Body;
%typemap(csclassmodifiers) b2Body "public partial class"

// %extend b2Body {
// 	void* CreateFixture(const b2FixtureDef* def)
// 	{
// 		return (void*)CreateFixture(def);
// 	}
// }

// %ignore b2Body::CreateFixture;
%rename(NativeCreateFixture) b2Body::CreateFixture;
%csmethodmodifiers b2Body::CreateFixture "private";
%typemap(cstype) b2Fixture* CreateFixture %{ IntPtr %}
%typemap(csout, excode=SWIGEXCODE) b2Fixture* CreateFixture {
    IntPtr cPtr = $imcall;$excode
    return cPtr;
}

%rename(NativeDestroyFixture) b2Body::DestroyFixture;
%csmethodmodifiers b2Body::DestroyFixture "private";

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

// %typemap(cscode) b2Body %{
// 	public List<Fixture> Fixtures { get; private set; }

//   public b2Fixture CreateFixture(b2FixtureDef def) {
//     b2Fixture ret = NativeCreateFixture(def);
//     Fixtures.Add(ret);
//     return ret;
//   }

//   public b2Fixture CreateFixture(b2Shape shape, float density) {
//     b2Fixture ret = NativeCreateFixture(shape, density);
//     Fixtures.Add(ret);
//     return ret;
//   }

//   public void DestroyFixture(b2Fixture fixture) {
//     NativeDestroyFixture(fixture);
//     Fixtures.Remove(fixture);
//   }
// %}