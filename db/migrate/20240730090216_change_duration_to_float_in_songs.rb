class ChangeDurationToFloatInSongs < ActiveRecord::Migration[7.1]
  def up
    # First, add the new column with the float type
    add_column :songs, :new_duration, :float

    # Migrate data from old column to new column
    Song.reset_column_information
    Song.find_each do |song|
      song.update_column(:new_duration, song.duration.to_f) if song.duration.present?
    end

    # Remove the old column
    remove_column :songs, :duration

    # Rename the new column to the old column name
    rename_column :songs, :new_duration, :duration
  end

  def down
    # Revert changes if the migration is rolled back

    # Add the old column back
    add_column :songs, :new_duration, :datetime

    # Migrate data from float back to datetime (if applicable)
    Song.reset_column_information
    Song.find_each do |song|
      song.update_column(:new_duration, Time.at(song.duration).utc) if song.duration.present?
    end

    # Remove the float column
    remove_column :songs, :duration

    # Rename the datetime column to the old column name
    rename_column :songs, :new_duration, :duration
  end
end
