(deftemplate plant
  (slot name)
  (multislot symptoms))

(deffacts plant-symptoms
  (plant (name plant1) (symptoms yellow_spots_on_leaves dark_brown_spots_with_halos lesions_with_watery_halos))
  (plant (name plant2) (symptoms dark_brown_concentric_rings_on_leaves wilting_of_lower_leaves yellowing_of_leaves))
  (plant (name plant3) (symptoms dark_brown_to_black_spots_on_leaves white_mold_on_underside_of_leaves rapid_browning_and_wilting_of_leaves))
  (plant (name plant4) (symptoms mosaic_patterns_on_leaves yellowing_of_leaves stunted_growth))
  (plant (name plant5) (symptoms yellowing_and_wilting_of_leaves brown_streaks_on_stems vascular_discoloration)))

(defrule bacterial-spot
  (plant (name ?plant) (symptoms $?symptoms))
  (and (member yellow_spots_on_leaves ?symptoms)
       (member dark_brown_spots_with_halos ?symptoms)
       (member lesions_with_watery_halos ?symptoms))
=>
  (printout t "Plant " ?plant " has bacterial spot." crlf))

(defrule early-blight
  (plant (name ?plant) (symptoms $?symptoms))
  (and (member dark_brown_concentric_rings_on_leaves ?symptoms)
       (member wilting_of_lower_leaves ?symptoms)
       (member yellowing_of_leaves ?symptoms))
=>
  (printout t "Plant " ?plant " has early blight." crlf))

(defrule late-blight
  (plant (name ?plant) (symptoms $?symptoms))
  (and (member dark_brown_to_black_spots_on_leaves ?symptoms)
       (member white_mold_on_underside_of_leaves ?symptoms)
       (member rapid_browning_and_wilting_of_leaves ?symptoms))
=>
  (printout t "Plant " ?plant " has late blight." crlf))

(defrule no-tomato-disease
  (plant (name ?plant) (symptoms $?symptoms))
  (not (member yellow_spots_on_leaves ?symptoms))
  (not (member dark_brown_spots_with_halos ?symptoms))
  (not (member lesions_with_watery_halos ?symptoms))
  (not (member dark_brown_concentric_rings_on_leaves ?symptoms))
  (not (member wilting_of_lower_leaves ?symptoms))
  (not (member yellowing_of_leaves ?symptoms))
  (not (member dark_brown_to_black_spots_on_leaves ?symptoms))
  (not (member white_mold_on_underside_of_leaves ?symptoms))
  (not (member rapid_browning_and_wilting_of_leaves ?symptoms))
=>
  (printout t "Plant " ?plant " does not have any known tomato diseases." crlf))
