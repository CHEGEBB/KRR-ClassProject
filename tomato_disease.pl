% Facts
symptom('Bacterial Spot', yellow_spots_on_leaves).
symptom('Bacterial Spot', dark_brown_spots_with_halos).
symptom('Bacterial Spot', lesions_with_watery_halos).

symptom('Early Blight', dark_brown_concentric_rings_on_leaves).
symptom('Early Blight', wilting_of_lower_leaves).
symptom('Early Blight', yellowing_of_leaves).

symptom('Late Blight', dark_brown_to_black_spots_on_leaves).
symptom('Late Blight', white_mold_on_underside_of_leaves).
symptom('Late Blight', rapid_browning_and_wilting_of_leaves).

symptom('Mosaic Virus', mosaic_patterns_on_leaves).
symptom('Mosaic Virus', yellowing_of_leaves).
symptom('Mosaic Virus', stunted_growth).

symptom('Fusarium Wilt', yellowing_and_wilting_of_leaves).
symptom('Fusarium Wilt', brown_streaks_on_stems).
symptom('Fusarium Wilt', vascular_discoloration).

symptom('Verticillium Wilt', wilting_of_leaves).
symptom('Verticillium Wilt', yellowing_between_veins).
symptom('Verticillium Wilt', brown_streaks_on_stems).

% Rules
disease(Disease) :-
    symptom(Disease, _).

% Symptoms for a specific disease
symptoms_for_disease(Disease, Symptoms) :-
    setof(Symptom, symptom(Disease, Symptom), Symptoms).

% Example queries
% Query by providing symptoms
?- disease(Disease), write('The likely tomato disease is: '), write(Disease), nl.

% Query by providing disease name and display symptoms
?- symptoms_for_disease('Bacterial Spot', Symptoms), 
   write('Symptoms for Bacterial Spot: '), write(Symptoms), nl.
