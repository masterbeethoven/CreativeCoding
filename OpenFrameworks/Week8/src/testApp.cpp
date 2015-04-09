#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
	ofSetCircleResolution(50);
	ofSetFrameRate(60);
	ofSetWindowShape(1024, 768);
	ofBackground(0, 0, 0);
	ofSetVerticalSync(true);
	ofEnableSmoothing();
	//ofSetFullscreen(true);
	
	w = ofGetWidth();
	h = ofGetHeight();
	
	// listen on the given port
	cout << "listening for osc messages on port " << PORT << "\n";
	receiver.setup( PORT );
}

//--------------------------------------------------------------
void testApp::update(){
	// check for waiting messages
	while( receiver.hasWaitingMessages() )
	{
		
		
		
		// get the next message
		ofxOscMessage m;
		float x,y;
		receiver.getNextMessage( &m );
		
		if ( m.getAddress() == "/wii/2/accel/pry/0" )
		{
			x = m.getArgAsFloat( 0 );
			wiiX = x * w;
			cout << "x: " << wiiX << " y: " << wiiY << "\n";
		}
		/*else if ( m.getAddress() == "/wii/2/accel/pry/0" )
		 {
		 y = 1 - m.getArgAsFloat( 0 );
		 wiiY = y * h;
		 cout << "x: " << wiiX << " y: " << wiiY << "\n";
		 }
		 else
		 {
		 cout << "message: " << m.getAddress() << "\n";
		 }*/
	}
}

//--------------------------------------------------------------
void testApp::draw(){
	ofSetColor(255, 130, 0);
	float radius = 50;
	ofFill();
	ofCircle(wiiX, wiiY, radius);
}

//--------------------------------------------------------------
void testApp::keyPressed(int key){
	
}

//--------------------------------------------------------------
void testApp::keyReleased(int key){
	
}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y){
	
}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){
	
}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){
}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){
	
}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){
	
}

//--------------------------------------------------------------
void testApp::gotMessage(ofMessage msg){
	
}

//--------------------------------------------------------------
void testApp::dragEvent(ofDragInfo dragInfo){
	
}
