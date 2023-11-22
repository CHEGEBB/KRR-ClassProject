(deftemplate plant
   (slot name)
   (multislot symptoms))

(deffacts plant-symptoms
   (plant (name tomato-plant-1) (symptoms yellow_spots_on_leaves dark_brown_spots_with_halos lesions_with_watery_halos))
   (plant (name tomato-plant-2) (symptoms dark_brown_concentric_rings_on_leaves wilting_of_lower_leaves yellowing_of_leaves))
   (plant (name tomato-plant-3) (symptoms dark_brown_to_black_spots_on_leaves white_mold_on_underside_of_leaves rapid_browning_and_wilting_of_leaves))
   ; Add more plant facts here...
)

(deffunction symptoms-for-disease (?disease)
   (bind ?symptoms "")
   (do-for-all-facts ((?f plant))
      (eq ?disease (fact-slot-value ?f name))
      (bind ?symptoms (implode$ (fact-slot-value ?f symptoms))))
   ?symptoms)

(deffunction find-symptoms-for-disease (?disease)
   (if (eq ?disease nil)
      then
      (printout t "Please provide a disease name." crlf)
      else
      (bind ?symptoms (symptoms-for-disease ?disease))
      (if (neq ?symptoms "")
         then
         (printout t "Symptoms for " ?disease ": " ?symptoms crlf)
         else
         (printout t "No information available for " ?disease crlf)
      )
   )
)

(defrule bacterial-spot
   (plant (name ?plant) (symptoms $?symptoms))
   (test (member$ yellow_spots_on_leaves ?symptoms))
   (test (member$ dark_brown_spots_with_halos ?symptoms))
   (test (member$ lesions_with_watery_halos ?symptoms))
   =>
   (printout t "Plant " ?plant " has bacterial spot." crlf))

(defrule early-blight
   (plant (name ?plant) (symptoms $?symptoms))
   (test (member$ dark_brown_concentric_rings_on_leaves ?symptoms))
   (test (member$ wilting_of_lower_leaves ?symptoms))
   (test (member$ yellowing_of_leaves ?symptoms))
   =>
   (printout t "Plant " ?plant " has early blight." crlf))

(defrule late-blight
   (plant (name ?plant) (symptoms $?symptoms))
   (test (member$ dark_brown_to_black_spots_on_leaves ?symptoms))
   (test (member$ white_mold_on_underside_of_leaves ?symptoms))
   (test (member$ rapid_browning_and_wilting_of_leaves ?symptoms))
   =>
   (printout t "Plant " ?plant " has late blight." crlf))

(defrule no-tomato-disease
   (plant (name ?plant) (symptoms $?symptoms))
   (test (not (member$ yellow_spots_on_leaves ?symptoms)))
   (test (not (member$ dark_brown_spots_with_halos ?symptoms)))
   (test (not (member$ lesions_with_watery_halos ?symptoms)))
   (test (not (member$ dark_brown_concentric_rings_on_leaves ?symptoms)))
   (test (not (member$ wilting_of_lower_leaves ?symptoms)))
   (test (not (member$ yellowing_of_leaves ?symptoms)))
   (test (not (member$ dark_brown_to_black_spots_on_leaves ?symptoms)))
   (test (not (member$ white_mold_on_underside_of_leaves ?symptoms)))
   (test (not (member$ rapid_browning_and_wilting_of_leaves ?symptoms)))
   =>
   (printout t "Plant " ?plant " does not have any known tomato diseases." crlf))
