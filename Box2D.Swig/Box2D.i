#pragma SWIG nowarn=201,312,516

%include "attribute.i"
%include "carrays.i"
%include "arrays_csharp.i"



%module(directors="1") Box2D
%{
#include <Box2D/Box2D.h>
%}

%feature("director") b2ContactListener;
%feature("director") b2Shape;

%rename(Equal) operator =;
%rename(PlusEqual) operator +=;
%rename(MinusEqual) operator -=;
%rename(MultiplyEqual) operator *=;
%rename(DivideEqual) operator /=;
%rename(PercentEqual) operator %=;
%rename(Plus) operator +;
%rename(Minus) operator -;
%rename(Multiply) operator *;
%rename(Divide) operator /;
%rename(Percent) operator %;
%rename(Not) operator !;
%rename(IndexIntoConst) operator[](unsigned idx) const;
%rename(IndexInto) operator[](unsigned idx);
%rename(Functor) operator ();
%rename(EqualEqual) operator ==;
%rename(NotEqual) operator !=;
%rename(LessThan) operator <;
%rename(LessThanEqual) operator <=;
%rename(GreaterThan) operator >;
%rename(GreaterThanEqual) operator >=;
%rename(And) operator &&;
%rename(Or) operator ||;
%rename(PlusPlusPrefix) operator++();
%rename(PlusPlusPostfix) operator++(int);
%rename(MinusMinusPrefix) operator--();
%rename(MinusMinusPostfix) operator--(int);

%ignore b2ContactManager;
%ignore b2FrictionJoint;
%ignore b2PrismaticJoint;
%ignore b2StackAllocator;
%ignore b2ContactPositionConstraint;
%ignore b2FrictionJointDef;
%ignore b2PrismaticJointDef;
%ignore b2StackEntry;
%ignore b2AABB;
%ignore b2ContactRegister;
%ignore b2GearJoint;
%ignore b2Profile;
%ignore b2Sweep;
%ignore b2Block;
%ignore b2ContactSolver;
%ignore b2GearJointDef;
%ignore b2PulleyJoint;
%ignore b2TempPolygon;
%ignore b2BlockAllocator;
%ignore b2ContactSolverDef;
%ignore b2GrowableStack;
%ignore b2PulleyJointDef;
%ignore b2Timer;
%ignore b2ContactVelocityConstraint;
%ignore b2Island;
%ignore b2QueryCallback;
%ignore b2TimeStep;
//%ignore b2BodyDef;
// %ignore b2DestructionListener;
%ignore b2Jacobian;
%ignore b2RayCastCallback;
%ignore b2TOIInput;
%ignore b2BroadPhase;
%ignore b2DistanceInput;
//%ignore b2Joint;
%ignore b2RayCastInput;
%ignore b2TOIOutput;
%ignore b2ChainAndCircleContact;
%ignore b2DistanceJoint;
//%ignore b2JointDef;
%ignore b2RayCastOutput;
//%ignore b2Transform;
%ignore b2ChainAndPolygonContact;
%ignore b2DistanceJointDef;
//%ignore b2JointEdge;
%ignore b2ReferenceFace;
%ignore b2TreeNode;
//%ignore b2ChainShape;
%ignore b2DistanceOutput;
//%ignore b2Manifold;
%ignore b2RevoluteJoint;
//%ignore b2Vec2;
%ignore b2Chunk;
%ignore b2DistanceProxy;
%ignore b2ManifoldPoint;
%ignore b2RevoluteJointDef;
%ignore b2Vec3;
%ignore b2CircleContact;
%ignore b2Draw;
//%ignore b2MassData;
%ignore b2Rope;
%ignore b2Velocity;
//%ignore b2CircleShape;
%ignore b2DynamicTree;
%ignore b2Mat22;
%ignore b2RopeDef;
%ignore b2VelocityConstraintPoint;
%ignore b2ClipVertex;
%ignore b2EdgeAndCircleContact;
%ignore b2Mat33;
%ignore b2RopeJoint;
%ignore b2Version;
%ignore b2Color;
%ignore b2EdgeAndPolygonContact;
%ignore b2MouseJoint;
%ignore b2RopeJointDef;
%ignore b2WeldJoint;
//%ignore b2Contact;
//%ignore b2EdgeShape;
%ignore b2MouseJointDef;
//%ignore b2Rot;
%ignore b2WeldJointDef;
%ignore b2ContactEdge;
%ignore b2EPAxis;
%ignore b2Pair;
%ignore b2SeparationFunction;
%ignore b2WheelJoint;
%ignore b2ContactFeature;
%ignore b2EPCollider;
%ignore b2PolygonAndCircleContact;
//%ignore b2Shape;
%ignore b2WheelJointDef;
%ignore b2ContactFilter;
//%ignore b2Filter;
%ignore b2PolygonContact;
%ignore b2Simplex;
//%ignore b2World;
%ignore b2ContactID;
//%ignore b2Fixture;
//%ignore b2PolygonShape;
%ignore b2SimplexCache;
//%ignore b2WorldManifold;
//%ignore b2ContactImpulse;
//%ignore b2FixtureDef;
%ignore b2Position;
%ignore b2SimplexVertex;
%ignore b2WorldQueryWrapper;
// %ignore b2ContactListener;
%ignore b2FixtureProxy;
%ignore b2PositionSolverManifold;
%ignore b2SolverData;
%ignore b2WorldRayCastWrapper;
%ignore b2Dot;
%ignore b2Cross;
%ignore b2Mul;
%ignore b2MulT;
%ignore b2Mul22;
%ignore b2_version;
%ignore b2Abs;
%ignore b2GetPointStates;
%ignore b2ClipSegmentToLine;
%ignore b2TestOverlap;
%ignore b2PairLessThan;
%ignore b2Distance;
%ignore b2TimeOfImpact;

%include "Macros.i"
%include "Common.i"
%include "Structs.i"

%include "Dynamics/Body.i"
%include "BodyType.i"
%include "ChainShape.i"
%include "CircleShape.i"
%include "Contact.i"
%include "ContactListener.i"
%include "ContactImpulse.i"
%include "EdgeShape.i"
%include "Filter.i"
%include "Fixture.i"
%include "Joint.i"
%include "Manifold.i"
%include "MassData.i"
%include "PolygonShape.i"
%include "Shape.i"
%include "Transform.i"
%include "World.i"
%include "WorldManifold.i"

%include <Box2D/Common/b2Settings.h>
%include <Box2D/Common/b2Draw.h>
%include <Box2D/Common/b2Timer.h>
%include <Box2D/Common/b2Math.h>

%include <Box2D/Collision/Shapes/b2CircleShape.h>
%include <Box2D/Collision/Shapes/b2EdgeShape.h>
%include <Box2D/Collision/Shapes/b2ChainShape.h>
%include <Box2D/Collision/Shapes/b2PolygonShape.h>

%include <Box2D/Collision/b2BroadPhase.h>
%include <Box2D/Collision/b2Distance.h>
%include <Box2D/Collision/b2DynamicTree.h>
%include <Box2D/Collision/b2TimeOfImpact.h>

%include <Box2D/Dynamics/b2Body.h>
%include <Box2D/Dynamics/b2Fixture.h>
%include <Box2D/Dynamics/b2WorldCallbacks.h>
%include <Box2D/Dynamics/b2TimeStep.h>
%include <Box2D/Dynamics/b2World.h>

%include <Box2D/Dynamics/Contacts/b2Contact.h>

%include <Box2D/Dynamics/Joints/b2DistanceJoint.h>
%include <Box2D/Dynamics/Joints/b2FrictionJoint.h>
%include <Box2D/Dynamics/Joints/b2GearJoint.h>
%include <Box2D/Dynamics/Joints/b2MouseJoint.h>
%include <Box2D/Dynamics/Joints/b2PrismaticJoint.h>
%include <Box2D/Dynamics/Joints/b2PulleyJoint.h>
%include <Box2D/Dynamics/Joints/b2RevoluteJoint.h>
%include <Box2D/Dynamics/Joints/b2RopeJoint.h>
%include <Box2D/Dynamics/Joints/b2WeldJoint.h>
