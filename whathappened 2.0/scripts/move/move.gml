function updateFractions() {
	x_vel += x_velFraction;
	y_vel += y_velFraction;
	x_velFraction = frac(x_vel);
	y_velFraction = frac(y_vel);
	x_vel -= x_velFraction;
	y_vel -= y_velFraction;
}

function moveCollide_x(amount){

x += amount;
if meeting(x,y) {
	repeat abs(amount) {
		x -= sign(amount);
		if !meeting(x,y) {
			break;
		}
	}
	return true
}
return false

}

function moveCollide_y(amount){

y += amount;
if meeting(x,y) {
	repeat abs(amount) {
		y -= sign(amount);
		if !meeting(x,y) {
			break;
		}
	}
	return true
}
return false

}