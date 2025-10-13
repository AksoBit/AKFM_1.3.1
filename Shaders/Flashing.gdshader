shader_type canvas_item;
uniform bool Flashing = false;
uniform bool White = false;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 Orig = texture(TEXTURE, UV);
	if (White && Flashing){
	COLOR = vec4(1.0, 1.0, 1.0, Orig.a);
	} else if (Flashing) {
	COLOR = vec4(0, 0, 0, Orig.a); 
	} else {
	COLOR = Orig; }
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
