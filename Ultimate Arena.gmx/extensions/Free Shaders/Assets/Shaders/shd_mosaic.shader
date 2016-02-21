attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_texcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float pixel_amount;

void main()
{ 
    vec2 res = vec2(1.0, resolution.x/resolution.y);
    vec2 size = vec2(res.x/pixel_amount, res.y/pixel_amount);
    vec2 uv = v_texcoord - mod(v_texcoord,size);
    gl_FragColor = texture2D( gm_BaseTexture, uv );
}
