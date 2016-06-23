SELECT id, MIN(cool_down_time, cook_time),MAX(cool_down_time, cook_time)
FROM baked_goods;