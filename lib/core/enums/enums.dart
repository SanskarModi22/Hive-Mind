enum ThemeMode {
  light,
  dark,
}

enum UserKarma {
  comment(1),
  textPost(2),
  linkPost(3),
  imagePost(3),
  awardPost(5),
  deletePost(-1);

  final int karma;
  const UserKarma(this.karma);
}
/*
The provided code defines an enumeration called `UserKarma`. Enumerations are a way to define a set of named constant values. In this case, `UserKarma` represents different types of actions or posts that a user can perform on a platform or community, and each action is associated with a specific amount of karma.

Here's a breakdown of the code:

1. The `enum` keyword is used to define an enumeration called `UserKarma`.
2. Inside the enumeration, several named constants are defined, each representing a different action or post type:
   - `comment` with a value of `1`
   - `textPost` with a value of `2`
   - `linkPost` with a value of `3`
   - `imagePost` with a value of `3`
   - `awardPost` with a value of `5`
   - `deletePost` with a value of `-1`
   Note that the values assigned to each constant are enclosed in parentheses after the constant name.
3. After defining the named constants, a final `int` variable called `karma` is declared. This variable is associated with each named constant and holds the corresponding karma value for that action or post type.
4. The `const UserKarma(this.karma)` syntax is a constructor that initializes the `karma` variable for each named constant in the enumeration.

In summary, this code provides a way to represent different types of user actions or posts, along with their associated karma values, using an enumeration. It allows for easy referencing and retrieval of the karma value based on the specific action or post type.
*/