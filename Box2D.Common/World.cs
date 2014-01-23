using System;
using System.Collections.Concurrent;
using System.Collections.Generic;

namespace Box2D
{
    public delegate void ContactEventHandler(object sender,ContactEventArgs e);
    public delegate void PreSolveEventHandler(object sender,PreSolveEventArgs e);
    public delegate void PostSolveEventHandler(object sender,PostSolveEventArgs e);

    public class ContactEventArgs : EventArgs
    {
        public Contact Contact { get; set; }
    }

    public class PreSolveEventArgs : EventArgs
    {
        public Contact Contact { get; set; }

        public Manifold Manifold { get; set; }
    }

    public class PostSolveEventArgs : EventArgs
    {
        public Contact Contact { get; set; }

        public ContactImpulse Impulse { get; set; }
    }

    public partial class World
    {
        public event ContactEventHandler BeginContact;

        public event ContactEventHandler EndContact;

        public event PreSolveEventHandler PreSolve;

        public event PostSolveEventHandler PostSolve;

        private ContactListener _contactListener;

        public ContactListener ContactListener
        {
            get
            {
                return _contactListener;
            }
            set
            {
                _contactListener = value;
                SetContactListener(_contactListener);
            }
        }

        protected virtual void OnBeginContact(ContactEventArgs e)
        {
            if (BeginContact != null)
                BeginContact(this, e);
        }

        protected virtual void OnEndContact(ContactEventArgs e)
        {
            if (BeginContact != null)
                BeginContact(this, e);
        }

        protected virtual void OnPreSolve(PreSolveEventArgs e)
        {
            if (PreSolve != null)
                PreSolve(this, e);
        }

        protected virtual void OnPostSolve(PostSolveEventArgs e)
        {
            if (PostSolve != null)
                PostSolve(this, e);
        }

        class CustomContactListener : ContactListener
        {
            private World _world;

            public CustomContactListener(World world)
            {
                _world = world;
            }

            public override void BeginContact(Contact contact)
            {
                _world.OnBeginContact(new ContactEventArgs() { Contact = contact });
            }

            public override void EndContact(Contact contact)
            {
                _world.OnEndContact(new ContactEventArgs() { Contact = contact });
            }

            public override void PreSolve(Contact contact, Manifold oldManifold)
            {
                _world.OnPreSolve(new PreSolveEventArgs() { Contact = contact, Manifold = oldManifold });
            }

            public override void PostSolve(Contact contact, ContactImpulse impulse)
            {
                _world.OnPostSolve(new PostSolveEventArgs() { Contact = contact, Impulse = impulse });
            }
        }
    }
}

