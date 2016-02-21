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

uniform sampler2D s_normalMap;
uniform sampler2D s_diffuseTex;

uniform float time;
uniform vec2 mouse_pos;

uniform vec2 u_resolution;
uniform vec2 u_textureRes;
uniform vec3 u_texturePos;

void main()
{   
    vec2 imagePos = v_texcoord - (u_texturePos.xy / u_resolution);
    vec2 aspectRatio = u_resolution / u_textureRes;
    vec2 ssUVs = imagePos * aspectRatio;

    vec2 normalMap = texture2D(s_normalMap, ssUVs).xy * 2.0 - 1.0;

    vec2 offset = v_texcoord + (normalMap * u_texturePos.z);
   
    gl_FragColor = texture2D(s_diffuseTex, ssUVs) * texture2D(gm_BaseTexture, offset.xy);
}
