'use strict';
module.exports = (sequelize, DataTypes) => {
  const Group_quest_answers = sequelize.define('Group_quest_answers', {
    id:  {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER,
  },
    teacher_id: DataTypes.INTEGER,
    user_id: DataTypes.INTEGER,
    group_quest_id: DataTypes.INTEGER,
    answer: DataTypes.STRING,
    active: DataTypes.STRING
  }, {});
  Group_quest_answers.associate = function(models) {
    // associations can be defined here
  };
  return Group_quest_answers;
};