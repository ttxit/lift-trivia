# Hosting Logic

When "Host" is chosen from the main menu, the scene is changed to `room_creation.tscn`, where the user can select [[Question Categories|category]], room size, and number of questions.

The user is also able to click Create to confirm their choices, or click back to return to the main menu.

When "Create" is clicked, the chosen category, randomized sequence of questions, and the current question index are saved to `user://game_data/question_sequence.json`.

> [!note]
> Currently, the question category always defaults to `sample_category`. This is expected to change when actual question categories are added.
