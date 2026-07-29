import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillaryRisePackage where
  tubeRadius : ℝ
  contactAngle : ℝ
  liquidDensity : ℝ
  gravitationalAcceleration : ℝ
  riseHeight : ℝ
  youngLaplaceBalance : Prop
  riseHeightDetermined : Prop
  youngLaplaceBalanceTerm : youngLaplaceBalance
  riseHeightDeterminedTerm : riseHeightDetermined

structure CapillaryRiseEvidence (C : CapillaryRisePackage) where
  youngLaplaceBalanceClosed : C.youngLaplaceBalance
  riseHeightDeterminedClosed : C.riseHeightDetermined

def CapillaryRiseClosed (C : CapillaryRisePackage) : Prop :=
  C.youngLaplaceBalance ∧ C.riseHeightDetermined

theorem capillary_rise_closed_from_evidence
    (C : CapillaryRisePackage) (E : CapillaryRiseEvidence C) :
    CapillaryRiseClosed C := by
  exact And.intro E.youngLaplaceBalanceClosed E.riseHeightDeterminedClosed

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse