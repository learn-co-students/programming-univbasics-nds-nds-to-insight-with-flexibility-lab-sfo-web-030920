  # Provided, don't edit
require 'directors_database'
require 'pry'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

pp directors_database

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #movie_with_director_name(name, x)
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  
 updated_info = []
 index = 0
 while index < movies_collection.length do
   x=movies_collection[index]
   updated_info << movie_with_director_name(name, x)
    index += 1
  end
  updated_info
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

  index = 0
  new_set = []
  while index < source.length do
    inner_index = 0
    while inner_index < source[index][:movies].length do
      # Adding :director_name key into each movie HASH so that hash has :title and :director_name
      x=source[index][:name]
      source[index][:movies][inner_index][:director_name] = x
      inner_index += 1
    end
    # Add movies ARRAY to a new array called new_set
    new_set << source[index][:movies]
    index += 1
  end
new_set
end

def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
 result = {}
 index = 0
 while index < collection.length do
   #binding.pry
   studio_name = collection[index][:studio]
   worldwide_gross = collection[index][:worldwide_gross]
    # Check to see if the studio_name is already a key in result hash. !result[studio_name] says that if studio_name is not already in result hash, then it will add the studio_name to result hash.
   if !result[studio_name]
     result[studio_name] = worldwide_gross
   else
     # If that stuio is already in result hash, it will add worldwide_gross to the existing worldwide_gross.
     result[studio_name] += worldwide_gross
   end
   index += 1
 end
result
end



# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  # Transform directors_database NDS by creating an array of movies arrays. Each movies array contains hashes, one hash for each individual movie
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  
  # Takes the AoA we just created above and flatten it into one big array of hashes
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  
  # Takes in the big AoH we just created and returns ONE hash with studio name as key and total 
  # worldwide_gross as the value.
  
  return gross_per_studio(movies_with_director_names)
  
end


# def calculate_total_alpha(collection)
 
#     index = 0
#     total_alpha = 0
#       while index < collection.length do
#         if collection[index][:studio] == "Alpha Films"
#           total_alpha += collection[index][:worldwide_gross]
#         end
#         index += 1
#       end
#       total_alpha
# end
    
#     def calculate_total_omega(collection)
#       k = 0
#       total_omega = 0
#       while k < collection.length do
#         if collection[k][:studio] == "Omega Films"
#           total_omega += collection[k][:worldwide_gross]
#         end
#         k += 1
#       end
#       total_omega
#   end
#   result = {}    
#   m = 0
#   while m < collection.length do
#     if collection[m][:studio] == "Alpha Films"
#       result[collection[m][:studio]] = calculate_total_alpha(collection)
#     end
#     m += 1
#   end

#   n = 0
#   while n < collection.length do
#     if collection[n][:studio] == "Omega Films"
#       result[collection[n][:studio]] = calculate_total_omega(collection)
#     end
#     n += 1
#   end
#   result