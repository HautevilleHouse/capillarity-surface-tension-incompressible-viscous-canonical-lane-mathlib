import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillaryNumberRegimePackage where
  capillaryNumber : ℝ
  viscousShear : ℝ
  surfaceTensionForceScale : ℝ
  regimeClassification : Prop
  dominantBalance : Prop
  regimeClassificationTerm : regimeClassification
  dominantBalanceTerm : dominantBalance

structure CapillaryNumberRegimeEvidence (C : CapillaryNumberRegimePackage) where
  regimeClassificationClosed : C.regimeClassification
  dominantBalanceClosed : C.dominantBalance

def CapillaryNumberRegimeClosed (C : CapillaryNumberRegimePackage) : Prop :=
  C.regimeClassification ∧ C.dominantBalance

theorem capillary_number_regime_closed_from_evidence
    (C : CapillaryNumberRegimePackage) (E : CapillaryNumberRegimeEvidence C) :
    CapillaryNumberRegimeClosed C := by
  exact And.intro E.regimeClassificationClosed E.dominantBalanceClosed

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse