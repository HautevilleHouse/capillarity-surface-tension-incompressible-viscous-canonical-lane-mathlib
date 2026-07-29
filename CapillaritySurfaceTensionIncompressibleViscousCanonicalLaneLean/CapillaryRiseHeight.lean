import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillaryRiseHeightPackage where
  tubeRadius : ℝ
  contactAngle : ℝ
  density : ℝ
  surfaceTension : ℝ
  gravitationalAcceleration : ℝ
  predictedHeight : ℝ
  jurinLawSatisfied : Prop
  heightComputedCorrectly : Prop

structure CapillaryRiseHeightEvidence (H : CapillaryRiseHeightPackage) where
  jurinLawSatisfiedClosed : H.jurinLawSatisfied
  heightComputedCorrectlyClosed : H.heightComputedCorrectly

def CapillaryRiseHeightClosed (H : CapillaryRiseHeightPackage) : Prop :=
  H.jurinLawSatisfied ∧ H.heightComputedCorrectly

theorem capillary_rise_height_closed_from_evidence
    (H : CapillaryRiseHeightPackage) (E : CapillaryRiseHeightEvidence H) :
    CapillaryRiseHeightClosed H := by
  exact And.intro E.jurinLawSatisfiedClosed E.heightComputedCorrectlyClosed

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse
