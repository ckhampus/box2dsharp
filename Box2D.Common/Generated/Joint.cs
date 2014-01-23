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

public class Joint : IDisposable {
  private HandleRef swigCPtr;
  protected bool swigCMemOwn;

  internal IntPtr Handle { get { return swigCPtr.Handle; } }

  internal Joint(IntPtr cPtr, bool cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = new HandleRef(this, cPtr);
  }

  internal static HandleRef getCPtr(Joint obj) {
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

  public virtual Vec2 GetReactionForce(float inv_dt) {
    Vec2 ret = Box2DPINVOKE.Joint_GetReactionForce(swigCPtr, inv_dt);
    return ret;
  }

  public virtual float GetReactionTorque(float inv_dt) {
    float ret = Box2DPINVOKE.Joint_GetReactionTorque(swigCPtr, inv_dt);
    return ret;
  }

  public virtual void ShiftOrigin(Vec2 newOrigin) {
    Box2DPINVOKE.Joint_ShiftOrigin(swigCPtr, ref newOrigin);
  }

  public b2JointType Type {
    get {
      b2JointType ret = (b2JointType)Box2DPINVOKE.Joint_Type_get(swigCPtr);
      return ret;
    } 
  }

  public Body BodyA {
    get {
      IntPtr cPtr = Box2DPINVOKE.Joint_BodyA_get(swigCPtr);
      Body ret = (cPtr == IntPtr.Zero) ? null : new Body(cPtr, false);
      return ret;
    } 
  }

  public Body BodyB {
    get {
      IntPtr cPtr = Box2DPINVOKE.Joint_BodyB_get(swigCPtr);
      Body ret = (cPtr == IntPtr.Zero) ? null : new Body(cPtr, false);
      return ret;
    } 
  }

  public Vec2 AnchorA {
    get { 
      IntPtr ptr = Box2DPINVOKE.Joint_AnchorA_get(swigCPtr);
      Vec2 ret = (Vec2)Marshal.PtrToStructure(ptr, typeof(Vec2));
      return ret;
    }
  
  }

  public Vec2 AnchorB {
    get { 
      IntPtr ptr = Box2DPINVOKE.Joint_AnchorB_get(swigCPtr);
      Vec2 ret = (Vec2)Marshal.PtrToStructure(ptr, typeof(Vec2));
      return ret;
    }
  
  }

  public Joint Next {
    get {
      IntPtr cPtr = Box2DPINVOKE.Joint_Next_get(swigCPtr);
      Joint ret = (cPtr == IntPtr.Zero) ? null : new Joint(cPtr, false);
      return ret;
    } 
  }

  public IntPtr UserData {
    set {
      Box2DPINVOKE.Joint_UserData_set(swigCPtr, value);
    } 
    get {
      IntPtr cPtr = Box2DPINVOKE.Joint_UserData_get(swigCPtr);
      return cPtr;
    }
  
  }

  public bool IsActive {
    get {
      bool ret = Box2DPINVOKE.Joint_IsActive_get(swigCPtr);
      return ret;
    } 
  }

  public bool CollideConnected {
    get {
      bool ret = Box2DPINVOKE.Joint_CollideConnected_get(swigCPtr);
      return ret;
    } 
  }

}

}
