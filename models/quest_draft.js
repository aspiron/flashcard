'use strict';
module.exports = (sequelize, DataTypes) => {
  const Quest_draft = sequelize.define('Quest_draft', {
    id:  {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: DataTypes.INTEGER,
  },
    title: DataTypes.STRING,
    text: DataTypes.STRING,
    teacher_id: DataTypes.INTEGER,
    active: DataTypes.STRING
  }, {});
  Quest_draft.associate = function(models) {
    // associations can be defined here
  };
  return Quest_draft;
};