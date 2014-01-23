// %apply void *VOID_INT_PTR { void * }

CS_MARSHAL_INTPTR(void*);
CS_MARSHAL_INTPTR(b2Contact*);

%typemap(csimports) SWIGTYPE %{ 
using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
%} 

// Proxy classes (base classes, ie, not derived classes)
%typemap(csbody) SWIGTYPE %{
  private HandleRef swigCPtr;
  protected bool swigCMemOwn;

  internal IntPtr Handle { get { return swigCPtr.Handle; } }

  internal $csclassname(IntPtr cPtr, bool cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = new HandleRef(this, cPtr);
  }

  internal static HandleRef getCPtr($csclassname obj) {
    return (obj == null) ? new HandleRef(null, IntPtr.Zero) : obj.swigCPtr;
  }
%}

// Derived proxy classes
%typemap(csbody_derived) SWIGTYPE %{
  private HandleRef swigCPtr;

  internal IntPtr Handle { get { return swigCPtr.Handle; } }

  internal $csclassname(IntPtr cPtr, bool cMemoryOwn) : base($imclassname.$csclazznameSWIGUpcast(cPtr), cMemoryOwn) {
    swigCPtr = new HandleRef(this, cPtr);
  }

  internal static HandleRef getCPtr($csclassname obj) {
    return (obj == null) ? new HandleRef(null, IntPtr.Zero) : obj.swigCPtr;
  }
%}
%array_functions(b2Contact, ContactArray);

// %array_functions(b2Vec2, Vec2Array);

// %apply float INOUT[] {float v[]}

// %rename("%(strip:[b2])s") "";

// %csmethodmodifiers new_b2Vec2Array "internal static";

// /**
//  * Typemap to use XNA Vectors.
//  */

// %typemap(cstype, out="Microsoft.Xna.Framework.Vector2") const b2Vec2& "Microsoft.Xna.Framework.Vector2"
// %typemap(csin, pre="    $csclassname temp$csinput = new $csclassname($csinput.X, $csinput.Y);") const b2Vec2 & "$csclassname.getCPtr(temp$csinput)"
// %typemap(csin, pre="    $csclassname temp$csinput = new $csclassname($csinput.X, $csinput.Y);") b2Vec2* "$csclassname.getCPtr(temp$csinput)"

// %typemap(cstype) b2Vec2* "Microsoft.Xna.Framework.Vector2"
// %typemap(cstype) b2Vec2 "Microsoft.Xna.Framework.Vector2"
// %typemap(csout, excode=SWIGEXCODE) b2Vec2 {
//   IntPtr cPtr = $imcall;$excode
//   $csclassname temp = null;
//   if (cPtr != IntPtr.Zero) {
//     temp = new $csclassname(cPtr, $owner);
//     return new Microsoft.Xna.Framework.Vector2(temp.x, temp.y);
//   }
//   return Microsoft.Xna.Framework.Vector2.Zero;
// }

// %typemap(cstype, out="Microsoft.Xna.Framework.Vector2") b2Vec2* "Microsoft.Xna.Framework.Vector2"
// %typemap(csvarin, excode=SWIGEXCODE2) b2Vec2* %{
//     /* csvarin typemap code */
//     set {
//       $csclassname temp$csinput = new $csclassname($csinput.X, $csinput.Y);
//       $imcall;$excode
//     }
// %}

// %typemap(csvarout, excode=SWIGEXCODE2) b2Vec2* %{
//     /* csvarout typemap code */
//     get {
//       IntPtr cPtr = $imcall;
//       if (cPtr != IntPtr.Zero) {
//         var temp = new $csclassname(cPtr, $owner);$excode
//         return new Microsoft.Xna.Framework.Vector2(temp.x, temp.y);
//       }
//       return Microsoft.Xna.Framework.Vector2.Zero;
//     }
// %}

// /**
//  * Typemap enums.
//  */

// %typemap(cstype, out="MonoGame.Physics.Box2D.BodyType") b2BodyType "MonoGame.Physics.Box2D.BodyType"
// %typemap(csout, excode=SWIGEXCODE) b2BodyType %{
//   return (Microsoft.Xna.Framework.BodyType)$imcall;$excode
// %}
// %typemap(csvarout, excode=SWIGEXCODE2) b2BodyType %{
//     /* csvarout typemap code */
//     get {
//       return (MonoGame.Physics.Box2D.BodyType)$imcall;$excode
//     }
// %}

// %typemap(cstype, out="MonoGame.Physics.Box2D.ShapeType") b2Shape::Type "MonoGame.Physics.Box2D.ShapeType"
// %typemap(csout, excode=SWIGEXCODE) b2Shape::Type {
//   return (Microsoft.Xna.Framework.ShapeType)$imcall;$excode
// }
// %typemap(csvarout, excode=SWIGEXCODE2) b2Shape::Type %{
//     /* csvarout typemap code */
//     get {
//       return (MonoGame.Physics.Box2D.ShapeType)$imcall;$excode
//     }
// %}


// /**
//  * Typemap b2Rot to floats.
//  */

// %typemap(cstype, out="float") const b2Rot& "float"
// %typemap(csin, pre="    b2Rot temp$csinput = new b2Rot($csinput);") const b2Rot& "$csclassname.getCPtr(temp$csinput)"
// %typemap(csin, pre="    b2Rot temp$csinput = new b2Rot($csinput);") b2Rot* "$csclassname.getCPtr(temp$csinput)"

// %typemap(cstype, out="float") b2Rot* "float"
// %typemap(csvarin, excode=SWIGEXCODE2) b2Rot* %{
//     /* csvarin typemap code */
//     set {
//       $csclassname temp$csinput = new $csclassname($csinput);
//       $imcall;$excode
//     }
// %}

// %typemap(csvarout, excode=SWIGEXCODE2) b2Rot* %{
//     /* csvarout typemap code */
//     get {
//       IntPtr cPtr = $imcall;
//       if (cPtr != IntPtr.Zero) {
//         var temp = new $csclassname(cPtr, $owner).GetAngle();$excode
//         return temp;
//       }
//       return 0;
//     }
// %}
