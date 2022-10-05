# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_002_133_901) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'barrels', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.integer 'material'
    t.float 'length'
    t.float 'diameter'
    t.integer 'compatibility'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'cylinder_heads', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.integer 'material'
    t.integer 'o_ring'
    t.string 'for_replica'
    t.boolean 'silenced'
    t.float 'weight'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'cylinders', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.integer 'material'
    t.float 'size'
    t.float 'diameter'
    t.float 'weigh'
    t.boolean 'drilled'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'gearboxes', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.string 'version'
    t.boolean 'quick_detach'
    t.boolean 'blowback'
    t.boolean 'reinfored'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'cylinder_id'
    t.integer 'cylinder_head_id'
    t.integer 'nozzle_id'
    t.integer 'piston_id'
    t.integer 'piston_head_id'
    t.integer 'spring_id'
    t.integer 'spring_guide_id'
  end

  create_table 'hop_up_units', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.integer 'material'
    t.string 'for_replica'
    t.float 'weight'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'joint_hop_ups', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.integer 'material'
    t.float 'length'
    t.integer 'toughness'
    t.integer 'compatibility'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'nozzles', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.integer 'material'
    t.integer 'o_ring'
    t.string 'for_replica'
    t.float 'weight'
    t.float 'length'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'piston_heads', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.integer 'material'
    t.boolean 'silenced'
    t.boolean 'on_bearing'
    t.float 'weight'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pistons', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.integer 'teeth_number'
    t.integer 'teeth_material'
    t.integer 'material'
    t.float 'weight'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'replicas', force: :cascade do |t|
    t.string 'brand'
    t.string 'name'
    t.string 'reference'
    t.integer 'category'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'gearbox_id'
    t.integer 'barrel_id'
    t.integer 'hop_up_unit_id'
    t.integer 'joint_hop_up_id'
  end

  create_table 'spring_guides', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.float 'length'
    t.boolean 'quick_detach'
    t.boolean 'on_bearing'
    t.float 'weight'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'springs', force: :cascade do |t|
    t.string 'brand'
    t.string 'reference'
    t.integer 'spires'
    t.boolean 'linear'
    t.float 'price'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
