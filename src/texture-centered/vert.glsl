precision mediump float;

attribute vec2 texc;
uniform vec4 posize;
uniform float angle;
uniform vec2 view;
varying vec2 vuv;

void main() {
    vuv = vec2(texc.x, 1. - texc.y);
    vec2 scaledVertex = (texc - 0.5) * posize.zw;
    vec2 rotatedVertex = scaledVertex;
    if(angle != 0.0) {
        mat2 rotation = mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
        rotatedVertex = rotation * scaledVertex;
    }

    // Translate to the rectangle's position
    vec2 worldPosition = posize.xy + rotatedVertex;

    // Transform to OpenGL clip space
    vec2 clipPosition = vec2((worldPosition.x / view.x) * 2.0 - 1.0, 1. - (worldPosition.y / view.y) * 2.0);

    gl_Position = vec4(clipPosition, 0.0, 1.0);
}
