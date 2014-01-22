%rename(ContactImpulse) b2ContactImpulse;

%extend b2ContactImpulse {
    void CreateLoop(float vertices[], int numVertices) {
        
    }

    void CreateChain(float vertices[], int numVertices) {
        
    }
}
//%ignore b2ChainShape::CreateLoop;
//%ignore b2ChainShape::CreateChain;