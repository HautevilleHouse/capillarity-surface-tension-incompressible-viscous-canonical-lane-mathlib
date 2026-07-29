import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure ContactAngleModelPackage where
  contactLine : Type u
  equilibriumAngle : Type v
  youngsEquation : Prop
  hysteresisBound : Prop
  dynamicContactAngle : Prop

structure ContactAngleModelEvidence (C : ContactAngleModelPackage) where
  youngsEquationClosed : C.youngsEquation
  hysteresisBoundClosed : C.hysteresisBound
  dynamicContactAngleClosed : C.dynamicContactAngle

def ContactAngleModelClosed (C : ContactAngleModelPackage) : Prop :=
  C.youngsEquation ∧ C.hysteresisBound ∧ C.dynamicContactAngle

theorem contact_angle_model_closed_from_evidence
    (C : ContactAngleModelPackage) (E : ContactAngleModelEvidence C) :
    ContactAngleModelClosed C := by
  exact And.intro E.youngsEquationClosed
    (And.intro E.hysteresisBoundClosed E.dynamicContactAngleClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse