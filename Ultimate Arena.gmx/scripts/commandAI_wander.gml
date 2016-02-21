
/*
    CIRCLE_DISTANCE = 14;
    CIRCLE_RADIUS = 14;
   // Calculate the circle center
   
   circleCenter = speed_dir_to_vect2(speed,direction);
   //circleCenter.normalize();
   vect_norm(circleCenter);
   //circleCenter.scaleBy(CIRCLE_DISTANCE);
   vect_scaler(circleCenter,CIRCLE_DISTANCE);
   
   wanderForce = vect2(3,wanderAngle); */
   
   wanderAngle += random(1) * wanderChange - wanderChange * .5;//change the angle randomly to make it wander
   DIR = wanderAngle;

 
/*
   var len :Number = vector.length;
   vector.x = Math.cos(value) * len;
   vector.y = Math.sin(value) * len;
*/


/*
private var circleRadius:int = 6; //the radius of the circle
private var wanderAngle:Number = 0; //the change to the current direction. Produces sustained turned, keeps it from being jerky. Makes it smooth
private var wanderChange:Number = 1; //the amount to change the angle each frame.
//Those numbers can be changed to get other movement patterns. Those are the defaults used in the demo
public function wander():void {
var circleMidde:Vector2D = velocity.cloneVector().normalize().multiply(circleRadius); //circle middle is the the velocity pushed out to the radius.
var wanderForce:Vector2D = new Vector2D();
wanderForce.length = 3;//force length, can be changed to get a different motion
wanderForce.angle = wanderAngle;//set the angle to move
wanderAngle += Math.random() * wanderChange - wanderChange * .5;//change the angle randomly to make it wander
var force:Vector2D = circleMidde.add(wanderForce);//apply the force
velocity.add(force);//then update
}


*/
