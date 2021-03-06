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

public class CircleShape : Shape {
  private HandleRef swigCPtr;

  internal IntPtr Handle { get { return swigCPtr.Handle; } }

  internal CircleShape(IntPtr cPtr, bool cMemoryOwn) : base(Box2DPINVOKE.CircleShape_SWIGUpcast(cPtr), cMemoryOwn) {
    swigCPtr = new HandleRef(this, cPtr);
  }

  internal static HandleRef getCPtr(CircleShape obj) {
    return (obj == null) ? new HandleRef(null, IntPtr.Zero) : obj.swigCPtr;
  }

  ~CircleShape() {
    Dispose();
  }

  public override void Dispose() {
    lock(this) {
      if (swigCPtr.Handle != IntPtr.Zero) {
        if (swigCMemOwn) {
          swigCMemOwn = false;
          Box2DPINVOKE.delete_CircleShape(swigCPtr);
        }
        swigCPtr = new HandleRef(null, IntPtr.Zero);
      }
      GC.SuppressFinalize(this);
      base.Dispose();
    }
  }

  public CircleShape() : this(Box2DPINVOKE.new_CircleShape(), true) {
  }

  public int GetSupport(Vec2 d) {
    int ret = Box2DPINVOKE.CircleShape_GetSupport(swigCPtr, ref d);
    return ret;
  }

  public Vec2 GetSupportVertex(Vec2 d) {
    IntPtr ptr = Box2DPINVOKE.CircleShape_GetSupportVertex(swigCPtr, ref d);
    Vec2 ret = (Vec2)Marshal.PtrToStructure(ptr, typeof(Vec2));
    return ret;
  }

  public Vec2 Position {
    set {
      Box2DPINVOKE.CircleShape_Position_set(swigCPtr, ref value);
    } 
    get { 
      IntPtr ptr = Box2DPINVOKE.CircleShape_Position_get(swigCPtr);
      Vec2 ret = (Vec2)Marshal.PtrToStructure(ptr, typeof(Vec2));
      return ret;
    }
  
  }

  public int VertexCount {
    get {
      int ret = Box2DPINVOKE.CircleShape_VertexCount_get(swigCPtr);
      return ret;
    } 
  }

}

}
