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

uniform float circleRadius;// 0.25 0.4 0.6
uniform float  minZoom;
uniform float maxZoom;

void main()
{ 
    vec4 base_texture = texture2D(gm_BaseTexture, v_texcoord);
        
    vec2 uv = v_texcoord;
    uv.x *= (resolution.x/resolution.y);
    float centre_x = (mouse_pos.x / resolution.x) * (resolution.x/resolution.y);
    float centre_y = mouse_pos.y / resolution.y;
  
    float maxX = centre_x + circleRadius;
    float minX = centre_x - circleRadius;
    float maxY = centre_y + circleRadius;
    float minY = centre_y - circleRadius;

    if( uv.x > minX && uv.x < maxX && uv.y > minY && uv.y < maxY)
    {
        float relX = uv.x - centre_x;
        float relY = uv.y - centre_y;
        float ang =  atan(relY, relX);
        float dist = sqrt(relX*relX + relY*relY);
    
    if( dist <= circleRadius )
    {
        float newRad = dist * ( (maxZoom * dist/circleRadius) + minZoom );
        float newX = centre_x + cos( ang ) * newRad;
        newX *= (resolution.y/resolution.x);
        float newY = centre_y + sin( ang ) * newRad;
        gl_FragColor = texture2D(gm_BaseTexture, vec2(newX, newY) );
    }
    else
    {
        gl_FragColor = base_texture;
    }
    
}
else
    {
       gl_FragColor = base_texture;
    }  
}
