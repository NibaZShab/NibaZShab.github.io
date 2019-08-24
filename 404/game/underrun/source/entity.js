
class entity_t {
  constructor(x, y, z, friction, sprite, init_param) {
    var t = this;
    t.x = x; t.y = y; t.z = z;
    t.vx = t.vy = t.vz = t.ax = t.ay = t.az = 0;
    t.f = friction;
    t.s = sprite;
    t.h = 5;
    
    t._init(init_param);
    entities.push(t);
  }
  
  _init(init_param) {}
  
  _update() {
    var t = this,
      last_x = t.x, last_z = t.z;
    
    t.vx += t.ax * time_elapsed - t.vx * _math.min(t.f * time_elapsed, 1);
    t.vy += t.ay * time_elapsed - t.vy * _math.min(t.f * time_elapsed, 1);
    t.vz += t.az * time_elapsed - t.vz * _math.min(t.f * time_elapsed, 1);
    
    t.x += t.vx * time_elapsed;
    t.y += t.vy * time_elapsed;
    t.z += t.vz * time_elapsed;
    
    if (t._collides(t.x, last_z)) {
      t._did_collide(t.x, t.y);
      t.x = last_x;
      t.vx = 0;
    }
    
    if (t._collides(t.x, t.z)) {
      t._did_collide(t.x, t.y);
      t.z = last_z;
      t.vz = 0;
    }
  }
  
  _collides(x, z) {
    return level_data[(x >> 3) + (z >> 3) * level_width] > 7 ||
    level_data[((x + 6) >> 3) + (z >> 3) * level_width] > 7 ||
    level_data[((x + 6) >> 3) + ((z+4) >> 3) * level_width] > 7 ||
    level_data[(x >> 3) + ((z+4) >> 3) * level_width] > 7;
  }
  
  _spawn_particles(amount) {
    for (var i = 0; i < amount; i++) {
      var particle = new entity_particle_t(this.x, 0, this.z, 1, 30);
      particle.vx = (_math.random() - 0.5) * 128;
      particle.vy = _math.random() * 96;
      particle.vz = (_math.random() - 0.5) * 128;
    }
  }
  
  _did_collide() {}
  
  _check(other) {}
  
  _receive_damage(from, amount) {
    this.h -= amount;
    if (this.h <= 0) {
      this._kill();
    }
  }
  
  _kill() {
    if (!this._dead) {
      this._dead = true;
      entities_to_kill.push(this);
    }
  }
  
  _render() {
    var t = this;
    push_sprite(t.x-1, t.y, t.z, t.s);
  }
}
