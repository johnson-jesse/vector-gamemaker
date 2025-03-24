if (keyboard_check(vk_right)) {
    steering.rotate(-rotation_speed);
}

if (keyboard_check(vk_left)) {
    steering.rotate(rotation_speed);
}

if (keyboard_check(vk_up)) {
    var thrust = steering.clone().multiply(accel); // Clone before modifying
    thrust.y = -thrust.y; // Account for GameMaker's inverted Y
    velocity.add(thrust).limit(speed_max);
} else velocity.lerps(fric);

// Update position with the velocity vector
position.add(velocity);

// Apply to built in GameMaker variables
x = position.x;
y = position.y;

image_angle = steering.facing();

move_wrap(true, true, sprite_width / 2);

// Apply x and y back to position in to account for any wrapping
position.x = x;
position.y = y;