/// @desc A basic vector class to work with motion
/// @param _x
/// @param _y
function Vector(_x, _y) constructor {
    x = _x;
    y = _y;
    
    /// @param _x
    /// @param _y
    /// @return {Struct.Vector} self
    static set = function(_x, _y) {
        x = _x;
        y = _y;
        return self;
    }

    /// @param {Struct.Vector} _other
    /// @return {Struct.Vector} self
    static add = function(_other) {
        x += _other.x;
        y += _other.y;
        return self;
    }

    /// @param {Struct.Vector} _other
    /// @return {Struct.Vector} self
    static subtract = function (_other) {
        x -= _other.x;
        y -= _other.y;
        return self;
    }

    /// @param {Real} _other
    /// @return {Struct.Vector} self
    static multiply = function(_other) {
        x *= _other;
        y *= _other;
        return self;
    }
    
    /// @desc Normalize makes a vector unit length (magnitude = 1) while keeping its direction the same.
    /// @return {Struct.Vector} self
    static normalize = function () {
        if ((x != 0) || (y != 0)) {
            var factor = 1 / magnitude();
            x = factor * x;
            y = factor * y;
        }
        
        return self;
    }
    
    /// @desc Rotates the vector by a fixed increment, relative to its current direction (in degrees).
    /// @param {Real} _increment
    static rotate = function(_increment) {
        var rad = degtorad(_increment);
        var cosA = cos(rad);
        var sinA = sin(rad);
        var _x = x;
        var _y = y;
    
        // Apply 2D rotation matrix
        x = (_x * cosA) - (_y * sinA);
        y = (_x * sinA) + (_y * cosA);
        
        return self;
    }
    
    /// @desc Linearly interpolates between this vector and another.
    /// @param {Real} _amt The amount to interpolate
    /// @param {Struct.Vector} _other
    /// @return {Struct.Vector} A new vector
    static lerps = function (_amt, _other = new VectorZero()) {
        x += (_other.x - x) * _amt;
        y += (_other.y - y) * _amt;
        
        return self;
        // Function named lerps since GameMaker erros out if this is 'lerp'
    }

    /// @param {Real} _max
    /// @return {Struct.Vector} self
    static set_magnitude = function(_max) {
        return normalize().multiply(_max);
    }
    
    /// @desc Limits the vector's magnitude
    /// @param {Real} _max
    /// @return {Struct.Vector} self
    static limit = function (_max) {
        return magnitude() > _max ? set_magnitude(_max) : self;
    }

    /// @param {Real} _other
    /// @return The dot product of the two vectors
    static dot = function(_other) {
        return x * _other.x + y * _other.y;
    }
    
    /// @desc Create a perpendicular vector (rotated 90 degrees) based on this one
    /// @return {Struct.Vector} A new vector
    static perpendicular = function () {
        return new Vector(-y, x);
    }
    
    /// @desc Get the magnitude (or length) of a vector represents how far it extends from the origin (0,0).
    /// @return {Real} length
    static magnitude = function() {
        // same as point_distance(0, 0, x, y) but more direct
        return sqrt(x * x + y * y);
    }
    
    /// @desc Get the direction
    /// @return {Real} The angle (direction) this vector is facing
    static facing = function() {
        return radtodeg(arctan2(y, x));
    }
    
    /// @desc Get the distance to another vector from self
    /// @return {Real} distance
    static distance = function (_other) {
        return sqrt((x - _other.x) * (x - _other.x) + (y - _other.y) * (y - _other.y));
    }
    
    /// @desc Copy the values from this vector into a new vector
    /// @return {Struct.Vector} A new vector
    static clone = function() {
        return new Vector(x, y);
    }
}

function VectorZero() : Vector(0, 0) constructor {}

/// @desc Create a new Vector to represent the given angle
/// @param {Real} _angle in degrees
function angle_to_vector(_angle) {
    var angle = degtorad(_angle);
    return new Vector(cos(angle), sin(angle));
}

/// @desc Translate a given Vector into an angle
/// @param {Struct.Vector} _vector
function vector_to_angle(_vector) {
    return radtodeg(arctan2(_vector.y, _vector.x));
}


























