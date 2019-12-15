'use strict';
module.exports = (sequelize, DataTypes) => {
  const Group_students = sequelize.define('Group_students', {
    id:  {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER,
  },
    user_id: DataTypes.INTEGER,
    group_id: DataTypes.INTEGER,
    active: DataTypes.STRING
  }, {});
  Group_students.associate = function(models) {
    // associations can be defined here
  };
  return Group_students;
};