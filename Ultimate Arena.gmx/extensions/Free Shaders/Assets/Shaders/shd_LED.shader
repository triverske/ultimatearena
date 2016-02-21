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

uniform vec2 resolution;
uniform float led_size;
uniform float brightness;  

vec4 pixelize(vec2 uv, float sca) {
    float dx = 1.0/sca;
    float dy = 1.0/sca;
    vec2 coord = vec2(dx*ceil(uv.x/dx),dy*ceil(uv.y/dy));
    return texture2D(gm_BaseTexture, coord);
}

void main()
{
        vec2 uv = v_texcoord;
       
        vec2 coor = uv*led_size;
        coor.x *= (resolution.x/resolution.y);
        
        vec4 resColor = pixelize(uv, led_size) * brightness;

        float mvx = abs(sin(coor.x*3.1415))*1.5;
        float mvy = abs(sin(coor.y*3.1415))*1.5;
        if (mvx*mvy < 1.0) {resColor=vec4(0.0,0.0,0.0,texture2D(gm_BaseTexture, v_texcoord).a);} else {resColor = resColor*(mvx*mvy);}

 gl_FragColor = resColor;
 
}
