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

public class PolygonShape : Shape {
  private HandleRef swigCPtr;

  internal IntPtr Handle { get { return swigCPtr.Handle; } }

  internal PolygonShape(IntPtr cPtr, bool cMemoryOwn) : base(Box2DPINVOKE.PolygonShape_SWIGUpcast(cPtr), cMemoryOwn) {
    swigCPtr = new HandleRef(this, cPtr);
  }

  internal static HandleRef getCPtr(PolygonShape obj) {
    return (obj == null) ? new HandleRef(null, IntPtr.Zero) : obj.swigCPtr;
  }

  ~PolygonShape() {
    Dispose();
  }

  public override void Dispose() {
    lock(this) {
      if (swigCPtr.Handle != IntPtr.Zero) {
        if (swigCMemOwn) {
          swigCMemOwn = false;
          Box2DPINVOKE.delete_PolygonShape(swigCPtr);
        }
        swigCPtr = new HandleRef(null, IntPtr.Zero);
      }
      GC.SuppressFinalize(this);
      base.Dispose();
    }
  }

  public PolygonShape() : this(Box2DPINVOKE.new_PolygonShape(), true) {
  }

  public void Set( Vec2  points, int count) {
    Box2DPINVOKE.PolygonShape_Set(swigCPtr,  ref points , count);
  }

  public void SetAsBox(float hx, float hy) {
    Box2DPINVOKE.PolygonShape_SetAsBox__SWIG_0(swigCPtr, hx, hy);
  }

  public void SetAsBox(float hx, float hy,  Vec2  center, float angle) {
    Box2DPINVOKE.PolygonShape_SetAsBox__SWIG_1(swigCPtr, hx, hy,  ref center , angle);
  }

  public int GetVertexCount() {
    int ret = Box2DPINVOKE.PolygonShape_GetVertexCount(swigCPtr);
    return ret;
  }

  public  Vec2  GetVertex(int index) {
        IntPtr ptr = Box2DPINVOKE.PolygonShape_GetVertex(swigCPtr, index);
        Vec2 ret = (Vec2)Marshal.PtrToStructure(ptr, typeof(Vec2));
        return ret;
    }

  public bool Validate() {
    bool ret = Box2DPINVOKE.PolygonShape_Validate(swigCPtr);
    return ret;
  }

  public Vec2 m_centroid {
    set {
      Box2DPINVOKE.PolygonShape_m_centroid_set(swigCPtr,  ref value );
    } 
        get { 
            IntPtr ptr = Box2DPINVOKE.PolygonShape_m_centroid_get(swigCPtr);
            Vec2 ret = (Vec2)Marshal.PtrToStructure(ptr, typeof(Vec2));
            return ret;
        }
    
  }

  public IntPtr m_vertices {
    set {
      Box2DPINVOKE.PolygonShape_m_vertices_set(swigCPtr,  value );
    } 
    get {
      IntPtr cPtr = Box2DPINVOKE.PolygonShape_m_vertices_get(swigCPtr);
      SWIGTYPE_p_b2Vec2 ret = (cPtr == IntPtr.Zero) ? null : new SWIGTYPE_p_b2Vec2(cPtr, false);
      return ret;
    } 
  }

  public IntPtr m_normals {
    set {
      Box2DPINVOKE.PolygonShape_m_normals_set(swigCPtr,  value );
    } 
    get {
      IntPtr cPtr = Box2DPINVOKE.PolygonShape_m_normals_get(swigCPtr);
      SWIGTYPE_p_b2Vec2 ret = (cPtr == IntPtr.Zero) ? null : new SWIGTYPE_p_b2Vec2(cPtr, false);
      return ret;
    } 
  }

  public int m_count {
    set {
      Box2DPINVOKE.PolygonShape_m_count_set(swigCPtr, value);
    } 
    get {
      int ret = Box2DPINVOKE.PolygonShape_m_count_get(swigCPtr);
      return ret;
    } 
  }

}

}
