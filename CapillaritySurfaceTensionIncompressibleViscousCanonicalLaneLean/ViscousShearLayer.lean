import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure ViscousShearLayerPackage where
  dynamicViscosity : ℝ
  shearRate : ℝ
  filmThickness : ℝ
  interfaceSlipCondition : Prop
  velocityProfileParabolic : Prop
  shearStressAtWall : Prop

structure ViscousShearLayerEvidence (V : ViscousShearLayerPackage) where
  interfaceSlipConditionClosed : V.interfaceSlipCondition
  velocityProfileParabolicClosed : V.velocityProfileParabolic
  shearStressAtWallClosed : V.shearStressAtWall

def ViscousShearLayerClosed (V : ViscousShearLayerPackage) : Prop :=
  V.interfaceSlipCondition ∧ V.velocityProfileParabolic ∧ V.shearStressAtWall

theorem viscous_shear_layer_closed_from_evidence
    (V : ViscousShearLayerPackage) (E : ViscousShearLayerEvidence V) :
    ViscousShearLayerClosed V := by
  exact And.intro E.interfaceSlipConditionClosed
    (And.intro E.velocityProfileParabolicClosed E.shearStressAtWallClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse
