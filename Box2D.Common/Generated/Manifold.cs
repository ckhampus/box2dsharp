/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.10
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

namespace Box2D {
 
using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;

public class Manifold : IDisposable {
  private HandleRef swigCPtr;
  protected bool swigCMemOwn;

  internal IntPtr Handle { get { return swigCPtr.Handle; } }

  internal Manifold(IntPtr cPtr, bool cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = new HandleRef(this, cPtr);
  }

  internal static HandleRef getCPtr(Manifold obj) {
    return (obj == null) ? new HandleRef(null, IntPtr.Zero) : obj.swigCPtr;
  }

  ~Manifold() {
    Dispose();
  }

  public virtual void Dispose() {
    lock(this) {
      if (swigCPtr.Handle != IntPtr.Zero) {
        if (swigCMemOwn) {
          swigCMemOwn = false;
          Box2DPINVOKE.delete_Manifold(swigCPtr);
        }
        swigCPtr = new HandleRef(null, IntPtr.Zero);
      }
      GC.SuppressFinalize(this);
    }
  }

  public SWIGTYPE_p_b2ManifoldPoint points {
    set {
      Box2DPINVOKE.Manifold_points_set(swigCPtr, SWIGTYPE_p_b2ManifoldPoint.getCPtr(value));
    } 
    get {
      IntPtr cPtr = Box2DPINVOKE.Manifold_points_get(swigCPtr);
      SWIGTYPE_p_b2ManifoldPoint ret = (cPtr == IntPtr.Zero) ? null : new SWIGTYPE_p_b2ManifoldPoint(cPtr, false);
      return ret;
    } 
  }

  public Vec2 localNormal {
    set {
      Box2DPINVOKE.Manifold_localNormal_set(swigCPtr,  ref value );
    } 
        get { 
            IntPtr ptr = Box2DPINVOKE.Manifold_localNormal_get(swigCPtr);
            Vec2 ret = (Vec2)Marshal.PtrToStructure(ptr, typeof(Vec2));
            return ret;
        }
    
  }

  public Vec2 localPoint {
    set {
      Box2DPINVOKE.Manifold_localPoint_set(swigCPtr,  ref value );
    } 
        get { 
            IntPtr ptr = Box2DPINVOKE.Manifold_localPoint_get(swigCPtr);
            Vec2 ret = (Vec2)Marshal.PtrToStructure(ptr, typeof(Vec2));
            return ret;
        }
    
  }

  public Manifold.Type type {
    set {
      Box2DPINVOKE.Manifold_type_set(swigCPtr, (int)value);
    } 
    get {
      Manifold.Type ret = (Manifold.Type)Box2DPINVOKE.Manifold_type_get(swigCPtr);
      return ret;
    } 
  }

  public int pointCount {
    set {
      Box2DPINVOKE.Manifold_pointCount_set(swigCPtr, value);
    } 
    get {
      int ret = Box2DPINVOKE.Manifold_pointCount_get(swigCPtr);
      return ret;
    } 
  }

  public Manifold() : this(Box2DPINVOKE.new_Manifold(), true) {
  }

  public enum Type {
    e_circles,
    e_faceA,
    e_faceB
  }

}

}
