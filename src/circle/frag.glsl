precision mediump float;
uniform vec2 center;
uniform float radius;
uniform vec2 view;
uniform vec4 color;
varying vec2 v_position;
void main() {
    vec2 position = vec2((v_position.x + 1.) / 2. * view.x, (v_position.y + 1.) / 2. * view.y);

    float distance = distance(position, center);
    if(distance > radius) {
        discard;
    }
    gl_FragColor = color;
}
