using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;

namespace Box2D
{
    public partial class Body
    {
        public World World { get; private set; }

        public List<Fixture> Fixtures { get; set; }

        public List<JointEdge> Joints { get; set; }

        public Body(World world) : this(IntPtr.Zero, true)
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

        public Fixture CreateFixture(FixtureDef def)
        {
            var fixturePtr = NativeCreateFixture(def);
            var fixture = World._freeFixtures.GetObject();
            fixture.Reset(this, fixturePtr);
            World._fixtures.Add(fixturePtr, fixture);
            Fixtures.Add(fixture);
            return fixture;
        }

        public Fixture CreateFixture(Shape shape, float density)
        {
            var fixturePtr = NativeCreateFixture(shape, density);
            var fixture = World._freeFixtures.GetObject();
            fixture.Reset(this, fixturePtr);
            World._fixtures.Add(fixturePtr, fixture);
            Fixtures.Add(fixture);
            return fixture;
        }

        public void DestroyFixture(Fixture fixture)
        {
            NativeDestroyFixture(fixture);
            World._fixtures.Remove(fixture.Handle);
            Fixtures.Remove(fixture);
            World._freeFixtures.PutObject(fixture);
        }
    }
}

