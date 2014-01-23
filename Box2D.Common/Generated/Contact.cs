/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.11
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

namespace Box2D {
 
using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;

public class Contact : IDisposable {
  private HandleRef swigCPtr;
  protected bool swigCMemOwn;

  internal IntPtr Handle { get { return swigCPtr.Handle; } }

  internal Contact(IntPtr cPtr, bool cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = new HandleRef(this, cPtr);
  }

  internal static HandleRef getCPtr(Contact obj) {
    return (obj == null) ? new HandleRef(null, IntPtr.Zero) : obj.swigCPtr;
  }

  public virtual void Dispose() {
    lock(this) {
      if (swigCPtr.Handle != IntPtr.Zero) {
        if (swigCMemOwn) {
          swigCMemOwn = false;
          throw new MethodAccessException("C++ destructor does not have public access");
        }
        swigCPtr = new HandleRef(null, IntPtr.Zero);
      }
      GC.SuppressFinalize(this);
    }
  }

  internal void Reset(IntPtr cPtr)
  {
    swigCPtr = new HandleRef(this, cPtr);
  }

  public void GetWorldManifold(WorldManifold worldManifold) {
    Box2DPINVOKE.Contact_GetWorldManifold(swigCPtr, WorldManifold.getCPtr(worldManifold));
  }

  public void ResetFriction() {
    Box2DPINVOKE.Contact_ResetFriction(swigCPtr);
  }

  public void ResetRestitution() {
    Box2DPINVOKE.Contact_ResetRestitution(swigCPtr);
  }

  public void SetTangentSpeed(float speed) {
    Box2DPINVOKE.Contact_SetTangentSpeed(swigCPtr, speed);
  }

  public float GetTangentSpeed() {
    float ret = Box2DPINVOKE.Contact_GetTangentSpeed(swigCPtr);
    return ret;
  }

  public virtual void Evaluate(Manifold manifold, Transform xfA, Transform xfB) {
    Box2DPINVOKE.Contact_Evaluate(swigCPtr, Manifold.getCPtr(manifold), Transform.getCPtr(xfA), Transform.getCPtr(xfB));
    if (Box2DPINVOKE.SWIGPendingException.Pending) throw Box2DPINVOKE.SWIGPendingException.Retrieve();
  }

  public Manifold Manifold {
    get {
      IntPtr cPtr = Box2DPINVOKE.Contact_Manifold_get(swigCPtr);
      Manifold ret = (cPtr == IntPtr.Zero) ? null : new Manifold(cPtr, false);
      return ret;
    } 
  }

  public IntPtr Next {
    get {
      IntPtr cPtr = Box2DPINVOKE.Contact_Next_get(swigCPtr);
      return cPtr;
    }
  
  }

  public Fixture FixtureA {
    get {
      IntPtr cPtr = Box2DPINVOKE.Contact_FixtureA_get(swigCPtr);
      Fixture ret = (cPtr == IntPtr.Zero) ? null : new Fixture(cPtr, false);
      return ret;
    } 
  }

  public Fixture FixtureB {
    get {
      IntPtr cPtr = Box2DPINVOKE.Contact_FixtureB_get(swigCPtr);
      Fixture ret = (cPtr == IntPtr.Zero) ? null : new Fixture(cPtr, false);
      return ret;
    } 
  }

  public bool IsTouching {
    get {
      bool ret = Box2DPINVOKE.Contact_IsTouching_get(swigCPtr);
      return ret;
    } 
  }

  public bool IsEnabled {
    set {
      Box2DPINVOKE.Contact_IsEnabled_set(swigCPtr, value);
    } 
    get {
      bool ret = Box2DPINVOKE.Contact_IsEnabled_get(swigCPtr);
      return ret;
    } 
  }

  public int ChildIndexA {
    get {
      int ret = Box2DPINVOKE.Contact_ChildIndexA_get(swigCPtr);
      return ret;
    } 
  }

  public int ChildIndexB {
    get {
      int ret = Box2DPINVOKE.Contact_ChildIndexB_get(swigCPtr);
      return ret;
    } 
  }

  public float Friction {
    set {
      Box2DPINVOKE.Contact_Friction_set(swigCPtr, value);
    } 
    get {
      float ret = Box2DPINVOKE.Contact_Friction_get(swigCPtr);
      return ret;
    } 
  }

  public float Restitution {
    set {
      Box2DPINVOKE.Contact_Restitution_set(swigCPtr, value);
    } 
    get {
      float ret = Box2DPINVOKE.Contact_Restitution_get(swigCPtr);
      return ret;
    } 
  }

}

}
