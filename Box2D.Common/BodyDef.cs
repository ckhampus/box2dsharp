using System;
using System.Collections.Concurrent;
using System.Runtime.InteropServices;

namespace Box2D
{
    [StructLayout(LayoutKind.Sequential, Pack = 1)]
    public struct BodyDef
    {
        public BodyType Type;

        public Vec2 Position;

        public float Angle;

        public Vec2 LinearVelocity;

        public float AngularVelocity;

        public float LinearDamping;

        public float AngularDamping;

        public bool AllowSleep;

        public bool Awake;

        public bool FixedRotation;

        public bool Bullet;

        public bool Active;

        public float GravityScale;

        public static BodyDef Default = new BodyDef()
        {
            Type = BodyType.StaticBody,
            Position = new Vec2(),
            Angle = 0,
            LinearVelocity = new Vec2(),
            AngularVelocity = 0,
            LinearDamping = 0,
            AngularDamping = 0,
            AllowSleep = true,
            Awake = true,
            FixedRotation = false,
            Bullet = false,
            Active = true,
            GravityScale = 1
        };
    }
}

