'use strict';
module.exports = (sequelize, DataTypes) => {
  const Group_quest = sequelize.define('Group_quest', {
    id:  {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER,
  },
    teacher_id: DataTypes.INTEGER,
    active: DataTypes.STRING
  }, {});
  Group_quest.associate = function(models) {
    // associations can be defined here
  };
  return Group_quest;
};