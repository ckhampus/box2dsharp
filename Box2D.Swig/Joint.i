%rename(Joint) b2Joint;
%ignore b2Joint::Dump;

%attribute(b2Joint, b2JointType, Type, GetType);
%attribute(b2Joint, b2Body, BodyA, GetBodyA);
%attribute(b2Joint, b2Body, BodyB, GetBodyB);
%attribute(b2Joint, b2Vec2, AnchorA, GetAnchorA);
%attribute(b2Joint, b2Vec2, AnchorB, GetAnchorB);
%attribute(b2Joint, b2Joint, Next, GetNext);
%attribute(b2Joint, void*, UserData, GetUserData, SetUserData);
%attribute(b2Joint, bool, IsActive, IsActive);
%attribute(b2Joint, bool, CollideConnected, GetCollideConnected);
